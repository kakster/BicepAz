param parLocation string 
param parVMName string
param parEnableMdm bool


resource resVm 'Microsoft.Compute/virtualMachines@2021-04-01' existing = {
  name: parVMName
}


resource aadLoginForWindows 'Microsoft.Compute/virtualMachines/extensions@2021-04-01' = {
  name: 'AADLoginForWindows'
  parent: resVm
  location: parLocation
  properties: {
    publisher: 'Microsoft.Azure.ActiveDirectory'
    type: 'AADLoginForWindows'
    typeHandlerVersion: '1.0'
    autoUpgradeMinorVersion: true
    settings: !parEnableMdm ? null : {
      mdmId: '0000000a-0000-0000-c000-000000000000'
    }
  }
}
