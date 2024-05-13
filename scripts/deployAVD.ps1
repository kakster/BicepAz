$customerNamePrefix = "kak"
#$vNetName = "vnet-"+$customerNamePrefix 
$vNetSubnetName = "Subnet1"
#$vNetResourceGroupName = "rg-$CustomerNamePrefix-plat-network"
$vNetAddreses = @('10.10.0.0/16','10.20.0.0/16')
$managedBy = 'Cloudmate'

$emailAlertRecipients = @{
    name = 'Alert15Min'
    emailAddress = 'kasper@silenealle.dk'
    status = 'enabled'
}


$vmGoldenImageName = "$($customerNamePrefix)-GoldenImage"
$vmGoldenImageSecure = $true
$vmGoldenImageSize = "Standard_DS3_v2"
$vmGoldenImageVersion = '1.0.0'
$vmImageSysprepName = "gi-sysprep"
$imageResouceGroupName = "rg-$customerNamePrefix-core-images"

$keyVaultName = "kv-$customerNamePrefix"

$logAnalyticsWorkSpaceName = 'la-kak-kaskri'

$avdHostpoolName = "avd-$CustomerNamePrefix-hostpool"
$avdResourceGroupName = "rg-$CustomerNamePrefix-plat-avd"
$avdApplicationGroupName = "avd-$CustomerNamePrefix-appgroup-desktop"
$avdHostpoolType = "Desktop"
#$userupn = 'kasper@silenealle.dk'

### Connect to azure:

Connect-AzAccount 

#For now choose subscription
Set-AzContext -Subscription 'KASKRI'

##### ManagementGroup Deployment



## New-AzManagementGroupDeployment     



New-AzSubscriptionDeployment -Name 'AZ-Fundamental' -Location 'westeurope' -verbose -TemplateFile ".\core_infrastructure.bicep" -ProceedIfNoChange `
    -parCustomerNamePrefix $customerNamePrefix `
    -parVnetAddressCIDR $vNetAddreses `
    -parEmailAlertRecipients $emailAlertRecipients `
    -parAlertsActionGroupName "AG-$customerNamePrefix-Alerts" `
    -parActionGroupShortName "Alerts15Min" `
    -parEnableDefaultVMAlertMetrics $true

#region createSnapshot

New-AzSubscriptionDeployment -Name 'CreateGoldenImage' -Location 'westeurope' -TemplateFile ".\avd_CreateGoldenImageVM.bicep" -verbose `
    -parCustomerNamePrefix $customerNamePrefix `
    -parVmSize $vmGoldenImageSize `
    -parVmSecure $vmGoldenImageSecure `
    -parVMName $vmGoldenImageName `
    -parVnetSubnetName $vNetSubnetName `
    -parKeyVaultName $keyVaultName `
    -parKeyVaultVMSecretName 'vmAdministrator'

#endregion

New-AzSubscriptionDeployment -Name 'CaptureGoldenImage' -Location 'westeurope' -TemplateFile ".\avd_CaptureGoldenImage.bicep" -verbose `
    -parSecureVm $vmGoldenImageSecure `
    -parTagVmManagedBy $managedBy `
    -parCustomerNamePrefix $customerNamePrefix `
    -parVmSize $vmGoldenImageSize `
    -parVMToSnapshotResourceGroupName $imageResouceGroupName `
    -parVMToSnapshot $vmGoldenImageName `
    -parVMNameSuffix $vmImageSysprepName `
    -parImageDefinitionName "AVD-Images"
    #-parImageVersionName $vmGoldenImageVersion `


### Cleanup resources
#region cleanUpResources
if (get-azvm -name "vm-$vmGoldenImageName") {
    Write-host "Computer exists"
    Remove-AzVM -Name "vm-$customerNamePrefix-$vmImageSysprepName" -ResourceGroupName $imageResouceGroupName -Force
    Remove-AzSnapshot -SnapshotName "snapshot-$customerNamePrefix-$vmImageSysprepName" -ResourceGroupName $imageResouceGroupName -Force
    stop-azvm -Name "vm-$vmGoldenImageName" -ResourceGroupName $imageResouceGroupName -Force
}
else {
    Write-host "Deployment failed" -foregroundColor Red
}
#endRegion cleanUpResources

#Building avd-platform
New-AzSubscriptionDeployment -Name 'UpdateAVDdiagnostic' -Location 'westeurope' -TemplateFile ".\avd_buildBackplane.bicep" -verbose `
    -parAVDSessionHostSecure $vmGoldenImageSecure `
    -parAVDHostPoolName $avdHostpoolName `
    -parAVDApplicationGroupType $avdHostpoolType `
    -parKeyVaultName "kv-$customerNamePrefix" `
    -parKeyVaultSecretName 'vmAdministrator' `
    -parLogAnalyticsWorkspaceName $logAnalyticsWorkSpaceName `
    -parImageGalleryResourceGroupName $imageResouceGroupName `
    -parImageGalleryImageDefinitionName "AVD-Images"
    #-parAVDApplicationGroupType $avdApplicationGroupName `

New-AzRoleAssignment -SignInName 'kasper@silenealle.dk' -RoleDefinitionName "Desktop Virtualization User" -ResourceName $avdApplicationGroupName -ResourceGroupName $avdResourceGroupName -ResourceType 'Microsoft.DesktopVirtualization/applicationGroups'
New-AzRoleAssignment -SignInName 'kasper@silenealle.dk' -RoleDefinitionName "Virtual Machine User Login" -ResourceName $avdApplicationGroupName -ResourceGroupName $avdResourceGroupName -ResourceType 'Microsoft.DesktopVirtualization/applicationGroups'

