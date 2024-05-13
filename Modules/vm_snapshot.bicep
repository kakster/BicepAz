param parLocation string = resourceGroup().location
//param parSnapshotName string
param parTimestamp string = utcNow('d')
@description('URL for the snapshot source resource')
param parSourceResourceID string 
param parSnapshotCreateOption string
@allowed([
  'Standard_LRS'
  'Standard_ZRS'
  'Premium_LRS'
])
param parSnapshotSKU string = 'Standard_LRS'
param parSnapshotName string





resource resVMSnapshot 'Microsoft.Compute/snapshots@2023-10-02' = {
  name: parSnapshotName
  location: parLocation
  tags: {
    created: parTimestamp
    location: parLocation
    osType: 'WindowsClient'
  }
  sku: {
    name: parSnapshotSKU 
  }
  /*extendedLocation: {
    name: 'string'
    type: 'EdgeZone'
  }*/
  properties: {
    /*completionPercent: int
    copyCompletionError: {
      errorCode: 'CopySourceNotFound'
      errorMessage: 'string'
    }*/
    creationData: {
      createOption: parSnapshotCreateOption
      
      //elasticSanResourceId: 'string'
      /*galleryImageReference: {
        communityGalleryImageId: 'string'
        id: 'string'
        lun: int
        sharedGalleryImageId: 'string'
      }*/
      /*imageReference: {
        communityGalleryImageId: 'string'
        id: 'string'
        lun: int
        sharedGalleryImageId: 'string'
      }*/
      //logicalSectorSize: int
      //performancePlus: bool
      //provisionedBandwidthCopySpeed: 'string'
      //securityDataUri: 'string'
      sourceResourceId: parSourceResourceID
      //sourceUri: 'string'
      //storageAccountId: 'string'
      //uploadSizeBytes: int
    }
    //dataAccessAuthMode: 'string'
    //diskAccessId: 'string'
    //diskSizeGB: int
    /*encryption: {
      diskEncryptionSetId: 'string'
      type: 'string'
    }*/
    /*encryptionSettingsCollection: {
      enabled: bool
      encryptionSettings: [
        {
          diskEncryptionKey: {
            secretUrl: 'string'
            sourceVault: {
              id: 'string'
            }
          }
          keyEncryptionKey: {
            keyUrl: 'string'
            sourceVault: {
              id: 'string'
            }
          }
        }
      ]
      encryptionSettingsVersion: 'string'
    }
    hyperVGeneration: 'string'
    incremental: bool
    networkAccessPolicy: 'string'
    osType: 'string'
    publicNetworkAccess: 'string'
    purchasePlan: {
      name: 'string'
      product: 'string'
      promotionCode: 'string'
      publisher: 'string'
    }
    securityProfile: {
      secureVMDiskEncryptionSetId: 'string'
      securityType: 'string'
    }
    supportedCapabilities: {
      acceleratedNetwork: bool
      architecture: 'string'
      diskControllerTypes: 'string'
    }
    supportsHibernation: bool*/
  }
}
output outSnapshotResourceId string = resVMSnapshot.id
output outSnapshot object = resVMSnapshot
