targetScope = 'subscription'

@description('Gets location for the resourceGroup where it is deployed')
param parDeploymentLocation string = deployment().location
@description('3 letters customer identification')
param parCustomerNamePrefix string /*= 'kak' */

@description('List of prefixes of the vnet to deploy')
param parVnetAddressCIDR array /*= [
    '10.10.0.0/16'
    '10.20.0.0/16'
]*/

param parAlertsActionGroupName string

param parActionGroupShortName string

@description('Email address for alerts')
param parEmailAlertRecipients array /*= [ {
  name: 'Alert 15 min'
  emailAddress: 'kasper@silenealle.dk'
  status: 'Enabled'

}
]
*/

@description('List containing objects for the subnets')
param parSubnetAddressSpaceCIDR array = [
  {
    name: 'Subnet1'
    subnetPrefix: '10.10.10.0/24'
    securityRules: [
      {
        name: 'inbound-allow-3389'
        properties: {
          priority: 1000
          access: 'Allow'
          direction: 'Inbound'
          destinationPortRange: '3389'
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: '213.32.243.154/32'
          destinationAddressPrefix: '*'
        }
      } 
    ] 
  }
]
@description('DNS server address to be used in vNet.')
param parDnsServerAddress array = [
  '8.8.8.8'
  '8.8.4.4'
]

@description('Appies default metrics for vm in azure log analytics')
param parEnableDefaultVMAlertMetrics bool

var varLogAnalyticsResourceGroupName = 'rg-${parCustomerNamePrefix}-plat-monitor'
var varLogAnalyticsWorkspaceName = 'la-${parCustomerNamePrefix}-${toLower(subscription().displayName)}'
var varNetworkResourceGroupName = 'rg-${parCustomerNamePrefix}-plat-network'



resource resNetworkResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: varNetworkResourceGroupName
  location: parDeploymentLocation
  tags: {
    location: parDeploymentLocation
  }
  properties: {}
}

module modVNet 'modules/vnet_fundamental.bicep' = {
  name: 'PlatformNetwork'
  scope: resNetworkResourceGroup
  params: {
    parVnetAddressSpaceCIDR: parVnetAddressCIDR
    parVnetLocation: parDeploymentLocation
    parCustomerName: parCustomerNamePrefix
    parSubnetAddressSpaceCIDR: parSubnetAddressSpaceCIDR
    parDNSServers: parDnsServerAddress
  }

}

resource resLogAnalyticsWorkspaceResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: varLogAnalyticsResourceGroupName
  location: parDeploymentLocation
  tags: {
    location: parDeploymentLocation
  }
  properties: {}
}

//deploys LogAnalytics and creates an actiongroup for emailAlerts
module modLAMonitoring 'Modules/mon_infrastructure.bicep' = {
  name: 'PlatformLogAnalytics'
  scope: resLogAnalyticsWorkspaceResourceGroup
  params: {
    parLogAnalyticsWorkspaceName: varLogAnalyticsWorkspaceName
    parLogAnalyticsWorkspaceLocation: parDeploymentLocation
    parActionGroupName: parAlertsActionGroupName
    parActionGroupShortName: parActionGroupShortName
    parEmailRecipients: parEmailAlertRecipients
  }
}
/*
module modKeyVault 'Modules/keyVault.bicep' = {
  scope: resNetworkResourceGroup
  name: 'KeyVault'
  params: {
    parCustomerNamePrefix: parCustomerNamePrefix
    parSecretVMAdministrator: ''
    parSecretName: ''
    parLocation: parDeploymentLocation
  }
}
*/

module modVMAlertMetrics 'Modules/vm_metrics.bicep' = if (parEnableDefaultVMAlertMetrics) {
  scope: resourceGroup(resLogAnalyticsWorkspaceResourceGroup.name)
  name: 'vmAlertMetrics'
  params: {
    parLocation: parDeploymentLocation
    parCustomerNamePrefix: parCustomerNamePrefix
    parLogAnalyticsWorkspaceName: modLAMonitoring.outputs.outLogAnalyticsWorkpaceName//varLogAnalyticsWorkspaceName
    parActionGroupName: parAlertsActionGroupName
  }
}
/*
module modRoleAssignment 'Modules/roleAssignment.bicep' = {
  scope: resourceGroup()
  name: 
  params: {
    parPrincipalId: 
    parPrincipalType: 
    parRoleName: 
  }
}

*/
output outLAWorkspaceName string = modLAMonitoring.name
output outVnetName string = modVNet.name
output outNSGInfo array = modVNet.outputs.outNSG
output outAlertsActionGroupId string = modLAMonitoring.outputs.outResActionGroupId
output outAlertsActionGroupName string = modLAMonitoring.outputs.outResActionGroupName
