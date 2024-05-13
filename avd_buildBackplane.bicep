targetScope = 'subscription'

param parCustomerNamePrefix string = 'kak'
param parLocation string = 'westeurope'

param parVnetName string = 'vnet-${parCustomerNamePrefix}'
param parVnetSubnetName string = 'Subnet1'
param parVnetResourceGroupName string = 'rg-${parCustomerNamePrefix}-plat-network'

param parKeyVaultName string  = 'kv-${parCustomerNamePrefix}'
param parKeyVaultSecretName string

//image gallery
param parImageGalleryResourceGroupName string 
param parImageGalleryName string = 'imggal_${parCustomerNamePrefix}_images'
param parImageGalleryImageDefinitionName string 

param parAVDHostPoolName string = 'avd-${parCustomerNamePrefix}-hostpool'
@description('The name users see when they should connect to the resources')
param parAVDHostPoolFriendlyName string = '${parCustomerNamePrefix} Win11'
param parAVDApplicationGroupName string = 'avd-${parCustomerNamePrefix}-appgroup-desktop'

//param parAVDApplicationGroupType string
param parAVDApplicationGroupType string = 'la-${parCustomerNamePrefix}-${toLower(subscription().displayName)}'
param parAVDWorkspaceName string = 'avd-${parCustomerNamePrefix}-ws'


param parAVDSessionHostVMNamePrefix string = '${parCustomerNamePrefix}-avd'
param parAVDSessionHostSize string = 'Standard_DS2_v2'
param parAVDSessionHostSecure bool

param parLogAnalyticsWorkspaceName string = 'la-${parCustomerNamePrefix}-${toLower(subscription().displayName)}'
param parLogAnalyticsResourceGroup string = 'rg-${parCustomerNamePrefix}-plat-monitor'


var varImageReference = resourceId(subscription().subscriptionId,parImageGalleryResourceGroupName,'Microsoft.Compute/galleries/images/versions', parImageGalleryName, parImageGalleryImageDefinitionName,'latest')
var varWorkspaceFriendlyName = '${parCustomerNamePrefix} Remote Desktop'

resource resSubnet 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' existing = {
  name: '${parVnetName}/${parVnetSubnetName}'
  scope: resourceGroup(parVnetResourceGroupName)
}
/*
resource resImage 'Microsoft.Compute/galleries/images/versions@2023-07-03' existing = {
  name: ''
  scope: resourceGroup(parImageGalleryResourceGroupName)
}
*/

resource resLogAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-10-01' existing = {
  name: parLogAnalyticsWorkspaceName
  scope: resourceGroup(parLogAnalyticsResourceGroup)
}


resource resAVDResourceGroup 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: 'rg-${parCustomerNamePrefix}-plat-avd'
  location: parLocation
  tags: {
    tier: 'AVD'
    location: parLocation
  }
  properties: {}
}

resource resKeyVault 'Microsoft.KeyVault/vaults@2023-07-01' existing = {
  name: parKeyVaultName
  scope: resourceGroup(parLogAnalyticsResourceGroup)
}

module modAVDInfrastructure 'Modules/avd_infrastructure.bicep' = {
  name: 'avdBackplane'
  scope: resAVDResourceGroup
  params: {
    parAVDHostPoolFriendlyName: parAVDHostPoolFriendlyName
    parAVDHostPoolName: parAVDHostPoolName
    parAVDApplicationGroupName: parAVDApplicationGroupName
    parAVDWorkspaceName: parAVDWorkspaceName
    parLocation: parLocation
    parAVDSessionHostVMAADJoin: true
    parApplicationGroupType: parAVDApplicationGroupType
    parAVDWorkSpaceFriendlyName: varWorkspaceFriendlyName
    parCustomerNamePrefix: parCustomerNamePrefix
    parEnableMonitoring: true
    parLogAnalyticsWorkSpaceId: resLogAnalyticsWorkspace.id
  }
}

module modAVDSessionHost 'Modules/avd_sessionHost.bicep' = {
  name: 'avdSessionHost'
  scope: resAVDResourceGroup
  params: {
    parLocation: parLocation
    parAVDSessionHostVMNamePrefix: parAVDSessionHostVMNamePrefix
    parAVDSessionHostCurrentInstances: 0
    parAVDSessionHostNumberOfInstancesToDeploy: 1
    parNicSubnetId: resSubnet.id
    parAVDSessionHostVMAADJoin: true
    parAVDVMImageTemplateResourceId: varImageReference //'/subscriptions/8668013c-0974-486e-92c1-d1e0193c42ef/resourceGroups/KAK-core-images/providers/Microsoft.Compute/galleries/imggal_kak_images/images/imggal-kak-definition/versions/0.0.1'//varImageReference
    parSessionHostVMSize: parAVDSessionHostSize
    parAVDHostPoolName: parAVDHostPoolName
    parAVDSessionMDMEnroll: false
    parAdminPassword: resKeyVault.getSecret(parKeyVaultSecretName)
    parDomainJoinDomainName: ''
    parDomainJoinOUPath: ''
    parDomainJoinPassword: ''
    parDomainJoinUsername: ''
    parCustomerNamePrefix: parCustomerNamePrefix
    parAVDSessionHostSecure: parAVDSessionHostSecure
  }
  dependsOn: [
    modAVDInfrastructure
  ]
}
/*
module modMonitoringMetrics 'Modules/vm_metrics.bicep' = {
  scope: resAVDResourceGroup
  name: 'VM-Metrics'
  params: {
    parLocation: parLocation
    parCustomerNamePrefix: parCustomerNamePrefix
    parLogAnalyticsWorkspaceName: parLogAnalyticsWorkspaceName
  }
}
*/
/*

module modRBAC 'Modules/roleAssignment.bicep' = {
  name: 'Rbac roles'
  scope: resAVDResourceGroup
  params: {
    parPrincipalId: 'kasper@silenealle.dk'
    parPrincipalType: 'User'
    parRoleName: 'Desktop Virtualization User'
  }
}
*/
