param parLocation string = resourceGroup().location
param parBastionName string

param parVnetName string


resource resSubnet 'Microsoft.Network/virtualNetworks/subnets@2023-09-01' existing = {
  name: '${parVnetName}/${parVnetSubnetName}'
  scope: resourceGroup(parVnetResourceGroupName)
}

resource resBastion 'Microsoft.Network/bastionHosts@2023-09-01' = {
  name: parBastionName
  location: parLocation
  sku: {
    name: 'Basic'
  }
  properties: {
    disableCopyPaste: false
    ipConfigurations: [ {
      id: ''
      name: ''
      properties: {
        publicIPAddress: {
        }
        subnet: {
          id: parSubnetId
        }
      }
    }
    
    ]  
  }
}
