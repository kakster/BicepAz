targetScope = 'subscription'

@description('Location for the resourceGroup')
param parLocation string = deployment().location
param parCustomerNamePrefix string

//@secure()
//param parAdminPassword string
@description('The name after vm-customerPrefix-XXXXX')
param parVmName string
param parVmSize string 
param parVmDiskType string  = ''
param parVMSecure bool
param parVmOsDiskCreateOption string = 'fromImage'

//ImageInfo
param parVmImageId string = ''
param parVmImagePublisher string = 'MicrosoftWindowsDesktop'
param parVmImageOffer string = 'windows-11'
param parVmImageSku string  = 'win11-23h2-avd'
param parVmAutomaticUpdatesEnabled bool = true

//tags
param parVmTagPatchSchedule string = '3rdThursday0400'

param parVmOsType string = 'Windows'
//Network

param parVMPublicIP bool = true
param parVnetName string = 'vnet-${toLower(parCustomerNamePrefix)}'
param parVnetSubnetName string = 'Subnet1'
param parVnetResourceGroupName string = 'rg-${toLower(parCustomerNamePrefix)}-plat-network'

param parKeyVaultName string
param parKeyVaultVMSecretName string

resource resKeyVault 'Microsoft.KeyVault/vaults@2023-07-01' existing = {
  name: parKeyVaultName
  scope: resourceGroup('rg-kak-plat-monitor')
}

resource resResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${toLower(parCustomerNamePrefix)}-core-images'
  location: parLocation
  tags: {
    location: parLocation
  }
  properties: {}
}

resource resSubnet 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' existing = {
  name: '${parVnetName}/${parVnetSubnetName}'
  scope: resourceGroup(parVnetResourceGroupName)
}

module modVmGoldenImageHost './Modules/vm.bicep' = {
  name: 'GoldenImage'
  scope: resResourceGroup
  params: {
    parCustomerNamePrefix: parCustomerNamePrefix
    parVmLocation: parLocation
    parVmName: parVmName
    parVmSize: parVmSize
    parVmSecure: parVMSecure
    parVmAdminPassword: resKeyVault.getSecret(parKeyVaultVMSecretName) 
    /// dette skal ændres
    parVmDiskType: parVmDiskType 
    parVmImageId: parVmImageId 
    parVmImagePublisher: parVmImagePublisher
    parVmImageOffer: parVmImageOffer
    parVmImageSku: parVmImageSku
    parVMOSType: parVmOsType
    parVMOSDiskCreateOption: parVmOsDiskCreateOption
    parVMOsDiskDeleteOption: 'delete'
    parVMOSAttachDiskId: ''
    parVmAutomaticUpdatesEnabled: parVmAutomaticUpdatesEnabled
    parSubnetId: resSubnet.id
    parVMPublicIP: parVMPublicIP
    parNicDNSServers: null
    parNicStaticPrivateIpAssignment: 'Dynamic'
    parNicStaticPrivateIpAddress: ''
    parVMNicDeleteOption: 'Delete'
    parTagVmOsType: 'Windows Client'
    parVmTagPatchSchedule: parVmTagPatchSchedule
    parVmLicenseType: 'Windows_Client'
  }
}

output outVMLocalIP string = modVmGoldenImageHost.outputs.outLocalIp
output outVMPublicIP string = parVMPublicIP == true ? modVmGoldenImageHost.outputs.outPublicIP : 'No public ip'
output outVMName string = modVmGoldenImageHost.outputs.outVMName
output outVMAdminUsername string = modVmGoldenImageHost.outputs.outVMUsername
