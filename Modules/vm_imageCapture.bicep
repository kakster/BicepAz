param parLocation string = resourceGroup().location
param parCustomerNamePrefix string 
param parTagVmManagedBy string

param parSubnetId string


param parSourceVmDiskToSnapshotName string
param parSourceVMDiskToSnapshotResourceId string = resourceId('Microsoft.Compute/disks', parSourceVmDiskToSnapshotName)
param parIsSourceVMSecure bool

param parSnapshotCreateOption string = 'copy'
param parSnapshotSku string = 'Standard_LRS'

param parVMSize string 
param parVMNameSuffix string

//image gallery

param parImageGalleryName string
param parImageDefinitionName string
param parImageVersionName string


var varVMName = 'vm-${parCustomerNamePrefix}-${parVMNameSuffix}'
var varNicName = 'nic-${parCustomerNamePrefix}-${parVMNameSuffix}'
var varVMDiskName = 'disk-${parCustomerNamePrefix}-${parVMNameSuffix}'
var varSnapShotName = 'snapshot-${parCustomerNamePrefix}-${parVMNameSuffix}'



//Creates snapshot
module modSnapshot 'vm_snapshot.bicep'  = {
  name: 'GoldenImageSnapshot'
  scope: resourceGroup()
  params:{
    parLocation: parLocation
    parSnapshotName: varSnapShotName
    parSourceResourceID: parSourceVMDiskToSnapshotResourceId
    parSnapshotCreateOption: parSnapshotCreateOption
    parSnapshotSKU: parSnapshotSku
  }
}


/// converts snapshot to new disk
module modVmDisk 'vm_disk.bicep' = {
  name: 'GoldenImageDiskCreation' 
  scope: resourceGroup()
  params: {
    parLocation: parLocation
    parDiskResourceName: varVMDiskName
    parSourceSnapshotResourceId: modSnapshot.outputs.outSnapshotResourceId
  }
  dependsOn: [modSnapshot]
}

//create virtual machine for sysprep
resource resNic 'Microsoft.Network/networkInterfaces@2023-09-01' = {
  name: varNicName
  location: parLocation
  tags: {
    location: parLocation
  }
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: parSubnetId
          }
        }
      }
    ]
  }
}


resource resVM 'Microsoft.Compute/virtualMachines@2023-09-01' = {
  name: varVMName
  location: parLocation
  tags: {
    location: parLocation
    patchSchedule: '2ndThursday'
    osType: 'Windows'
    managedBy: parTagVmManagedBy
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties:{
    hardwareProfile: {
      vmSize: parVMSize
    }
    storageProfile: {
      osDisk: {
        createOption: 'attach'
        deleteOption: 'Delete'
        osType: 'Windows'
        managedDisk: {
          id: modVmDisk.outputs.outDiskResourceID
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: resNic.id
          properties: {
            primary: true
            deleteOption: 'Delete'
          }
        }
      ]
    }
    securityProfile:  parIsSourceVMSecure == true ?{
      uefiSettings: {
        secureBootEnabled: true
        vTpmEnabled: true
      }
      securityType: 'TrustedLaunch'
    } : null
  }
}

resource resScriptExtension 'Microsoft.Compute/virtualMachines/extensions@2023-09-01' = {
  parent: resVM
  name: 'Sysprep'
  location: parLocation
  properties: {
    publisher: 'Microsoft.Compute'
    type: 'CustomScriptExtension'
    typeHandlerVersion: '1.10'
    autoUpgradeMinorVersion: true
    settings: {
      commandToExecute: '%WINDIR%\\system32\\sysprep\\sysprep.exe /generalize /oobe /shutdown /quiet /mode:vm'
    }
    protectedSettings: {}
  }
}

module modImageGallery 'avd_imageGallery.bicep' = {
  name: 'imageGallery'
  params: {
    parImageGalleryName: parImageGalleryName
    parLocation: parLocation
    parImageDefinitionName: parImageDefinitionName
    parImageSkuName: 'Standard-AVD-MS'
    parImageDiskSource: modVmDisk.outputs.outDiskResourceID
    parIsSourceVMSecure: parIsSourceVMSecure
    parImageVersionName: parImageVersionName
  }
  dependsOn: [
    resScriptExtension
  ]
}



output outModuleSnapShotResource string = modSnapshot.outputs.outSnapshotResourceId
//output outModuleVMName string = modVM.outputs.outVMName
//output outModuleVMUsername string = modVM.outputs.outVMUsername

