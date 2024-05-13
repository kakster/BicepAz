param parLocation string = 'Westeurope'
param parCustomerNamePrefix string
param parTagVmManagedBy string


//Snapshotparamaters
param parVMToSnapshotResourceGroupName string 
param parVMToSnapshot string
param parVMNameSuffix string = 'golden-sysprep'
param parVMSize string = 'Standard_DS2_v2'
param parSecureVM bool
//Network


param parVnetName string = 'vnet-${parCustomerNamePrefix}'
param parVnetSubnetName string = 'Subnet1'
param parVnetResourceGroupName string = 'rg-${parCustomerNamePrefix}-plat-network'

// image gallery info
param parImageGalleryName string = 'imggal_${parCustomerNamePrefix}_images'
param parImageDefinitionName string = 'imgdef-${parCustomerNamePrefix}-AVD'
param parImageVersionName string = '0.0.1'


resource resVMToSnapshot 'Microsoft.Compute/virtualMachines@2023-09-01' existing = {
  name: 'vm-${parVMToSnapshot}'
  scope: resourceGroup(parVMToSnapshotResourceGroupName)
}

resource resSubnet 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' existing = {
  name: '${parVnetName}/${parVnetSubnetName}'
  scope: resourceGroup(parVnetResourceGroupName)
}

module modCaptureGoldenImage 'Modules/vm_imageCapture.bicep' = {
  name: 'captureGoldenImage'
  scope: resourceGroup(parVMToSnapshotResourceGroupName)
  params: {
    parLocation: parLocation
    parCustomerNamePrefix: parCustomerNamePrefix
    parTagVmManagedBy: parTagVmManagedBy
    parSourceVmDiskToSnapshotName: resVMToSnapshot.properties.storageProfile.osDisk.name//parSourceVmDiskToSnapshotName
    parSubnetId: resSubnet.id
    parVMNameSuffix: parVMNameSuffix
    parVMSize: parVMSize
    parImageDefinitionName: parImageDefinitionName
    parImageGalleryName: parImageGalleryName
    parIsSourceVMSecure: parSecureVM
    parImageVersionName: parImageVersionName
  }
}
