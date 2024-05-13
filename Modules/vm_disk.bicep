param parLocation string = resourceGroup().location
param parDiskResourceName string 
param parDiskCreateOption string = 'copy'
param parSourceSnapshotResourceId string 
param parDiskSizeGB int = 127
param parDiskEncryptionType string = 'EncryptionAtRestWithPlatformKey'
param parDiskSku string = 'StandardSSD_LRS'

resource resDisk 'Microsoft.Compute/disks@2023-10-02' = {
  name: parDiskResourceName 
  location: parLocation
  tags:{
    Purpose: 'GoldenImage'
  }
  properties:{
    creationData:{
      createOption: parDiskCreateOption
      sourceResourceId: parDiskCreateOption == 'copy' ? parSourceSnapshotResourceId : null
    }
    diskSizeGB: parDiskSizeGB
    encryption: {
      type: parDiskEncryptionType
    }
  }
  sku: {
    name: parDiskSku
  }
}

output outDiskResourceID string  = resDisk.id
output outDiskName string = resDisk.name

