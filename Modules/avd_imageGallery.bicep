@description('Allowed characters are English alphanumeric characters, with underscores and periods allowed in the middle, up to 80 characters total. All other special characters, including dashes, are disallowed. (Code:BadRequest)')
@maxLength(80)
param parImageGalleryName string
param parImageDefinitionName string
param parImageVersionName string = '0.0.1'
param parLocation string
@description('Contains the Name')
param parImageSkuName string
@description('Allowed characters are uppercase or lowercase letters, digits, hyphen(-), period (.), underscore (_). Names are not allowed to end with period(.). The length of the name cannot exceed 64 characters.')
param parImageOfferName string = 'AVDMultiSession'
@allowed([
  'v1'
  'v2'
])
param parImageHyperVGeneration string = 'v2'
param parImageDiskSource string
param parIsSourceVMSecure bool



resource resImageGallery 'Microsoft.Compute/galleries@2023-07-03' = {
  name: parImageGalleryName
  location: parLocation
  tags: {
    location: parLocation
  }
  properties: {
    description: 'This Gallery is used for hosting images to be used within Azure'
  }
  
}

resource resImageDefinition 'Microsoft.Compute/galleries/images@2023-07-03' = {
  parent: resImageGallery
  name: parImageDefinitionName
  location: parLocation
  properties: {
    osType: 'Windows'
    osState: 'Generalized'
    identifier: {
      sku: parImageSkuName
      offer: parImageOfferName
      publisher: 'cloudMate'
    }
    hyperVGeneration: parImageHyperVGeneration
    features: parIsSourceVMSecure == true ? [ 
      {
        name: 'SecurityType'
        value: 'TrustedLaunch'
      }
      {
        name: 'IsHibernateSupported'
        value: 'true'
      }
      {
        name: 'IsAcceleratedNetworkSupported'
        value: 'true'
      } 
    ] : null
    recommended: {
      vCPUs: {
        max: 8
        min: 2
      }
      memory: {
        min: 8
        max: 32
      }
    }
  }
}


resource resImageVersion 'Microsoft.Compute/galleries/images/versions@2023-07-03' = {
  name: parImageVersionName
  location: parLocation
  parent: resImageDefinition
  properties: {
    storageProfile: {
      osDiskImage: {
        hostCaching: 'None'
        source: {
          id: parImageDiskSource
        }
      }
    }
  }
}
