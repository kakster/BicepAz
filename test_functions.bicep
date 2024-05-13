param parCore string = environment().suffixes.storage
param parCustomerNamePrefix string = 'kak'
param parModulesUrl string = 'https://wvdportalstorageblob.blob.${environment().suffixes.storage}/galleryartifacts/Configuration_8-16-2021.zip'

param parVMToSnapshot string = 'kak-GoldenImage'
param parVMResourceGroupName string = 'rg-kak-core-images'
param parImageGalleryName string = 'imggal_${parCustomerNamePrefix}_images'
param parImageGalleryImageDefinitionName string = 'imggal-${parCustomerNamePrefix}-definition'


var varImageReference = resourceId(parVMResourceGroupName,'Microsoft.Compute/galleries/images/versions', '${parImageGalleryName}', '${parImageGalleryImageDefinitionName}','latest')

resource resVMToSnapshot 'Microsoft.Compute/virtualMachines@2023-09-01' existing = {
  name: 'vm-${parVMToSnapshot}'
  scope: resourceGroup(parVMResourceGroupName)
}



output outParCore string = parCore
output outParModulesUrl string = parModulesUrl
output outVMInfo string = resVMToSnapshot.properties.securityProfile! == null ? 'no sec' : 'sec exist'
output outVarimageReference string = varImageReference
output outResourceVarImageReference string = resourceId(parVMResourceGroupName,'Microsoft.Compute/galleries/images/versions',parImageGalleryName,parImageGalleryImageDefinitionName,'latest')
