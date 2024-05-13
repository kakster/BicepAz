metadata name = 'KAK Bicep - Logging Module'
metadata description = 'KAK Bicep Module used to set up Logging'

param parVnetLocation string = resourceGroup().location
param parCustomerName string
//param environment string = 'p'
param parVnetName string = 'vnet-${toLower(parCustomerName)}'
param parVnetAddressSpaceCIDR array = []
param parSubnetAddressSpaceCIDR array = []
param parDNSServers array = []


//resource DontDelete 'Microsoft.Authorization/locks@2016-09-01' = {
//  name: 'DontDelete'
//  properties: {
//    level: 'CanNotDelete'
//    notes: 'Prevent deletion of the resourceGroup'
//  }
//}

resource resNsg 'Microsoft.Network/networkSecurityGroups@2023-04-01' = [for subNet in range(0, length(parSubnetAddressSpaceCIDR)): {
  name: 'nsg-${toLower(parCustomerName)}-${toLower(parSubnetAddressSpaceCIDR[subNet].Name)}'
  location: parVnetLocation
  properties: {
    securityRules: parSubnetAddressSpaceCIDR[subNet].securityRules
  }
  tags: {
    subnet: parSubnetAddressSpaceCIDR[subNet].name
  }
}
]

resource resVirtualNetwork 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: parVnetName
  location: parVnetLocation
  tags: {
    location: parVnetLocation
  }
  properties: {
    addressSpace: {
      addressPrefixes: parVnetAddressSpaceCIDR
    }
    dhcpOptions: {
        dnsServers: parDNSServers
      }
    
    subnets: [for i in range(0, length(parSubnetAddressSpaceCIDR)): {
      name: parSubnetAddressSpaceCIDR[i].Name
      properties: {
        addressPrefix: parSubnetAddressSpaceCIDR[i].subnetPrefix
        //serviceEndpoints: subnetAddressSpaceCIDR[i].ServiceEndpoints
        networkSecurityGroup: {
          id: resourceId('Microsoft.Network/networkSecurityGroups', toLower('nsg-${parCustomerName}-${parSubnetAddressSpaceCIDR[i].Name}'))
        }
        //privateEndpointNetworkPolicies: subnetAddressSpaceCIDR[i].PrivateEndpointNetworkPolicies
      }
    }]
  }
  dependsOn: [
    resNsg
  ]
}

output outSubnets array = [for i in range(0, length(parSubnetAddressSpaceCIDR)) : resVirtualNetwork.properties.subnets[i].name]
output outNSG array = [for subNet in range(0, length(parSubnetAddressSpaceCIDR)) : resNsg[subNet].name]
output outNSCSecurityRules array = [for subNet in range(0, length(parSubnetAddressSpaceCIDR)) : resNsg[subNet].properties.securityRules]
