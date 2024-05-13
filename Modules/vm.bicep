param parCustomerNamePrefix string

//network information
param parSubnetId string
param parNicStaticPrivateIpAssignment string = 'Dynamic'
param parNicStaticPrivateIpAddress string
param parNicDNSServers array = []
@allowed([
  'Delete'
  'Detach'
])
param parVMNicDeleteOption string
param parVMPublicIP bool


//VM Info
param parVmLocation string
@maxLength(15)
param parVmName string

@allowed( [
  'Standard_DS2_v2'
  'Standard_D1_v21'
  'Standard_D2_v2'
  'Standard_D3_v2'
  'Standard_D4_v2'
  'Standard_DS2_v2'
  'Standard_DS3_v2'
  'Standard_DS4_v2'
]
)
param parVmSize string

@description('Use Ephemeral if disk only should exist while the machine is running - nothing is saved.')
param parVmDiskType string = ''

@description('If secure is true there are some limitations regarding support. If its true it sets Security Type of the Virtual Machine to trusted launch and enable vTpm and UEFI. if false it will be standard')
param parVmSecure bool

@description('depends on image and parVMDiskType. Default is CacheDisk')
@allowed([
  'CacheDisk'
  'NvmeDisk'
  'ResourceDisk'
])
param parVmDiffDiskSettingsPlacement string = 'CacheDisk'

//Image Information
param parVmImageId string
param parVmImageSku string
param parVmImageOffer string
param parVmImagePublisher string

//VM OS Disk parameters
@allowed([
  'attach'
  'fromImage'
])
@description('User "Attach" for attaching a disk or "fromImage" allowed list could be expanding')
param parVMOSDiskCreateOption string
param parVMOSAttachDiskId string
param parVMOsDiskSizeGB int = 127
param parVMOsDiskDeleteOption string
@allowed([
  'Windows'
  'Linux'
])
param parVMOSType string
//Datadisk
param parVmDataDisks array = [
  
]

///Tags
@allowed([
  'Windows Server'
  'Windows Client'
  'Linux'
])
param parTagVmOsType string 
param parTagVmManagedBy string = 'Cloudmate'
//param parPatchType bool = false
param parVmAutomaticUpdatesEnabled bool 
param parVmTagPatchSchedule string
@allowed([
  'Windows_Client'
  'Windows Server'])
param parVmLicenseType string  

@secure()
param parVmAdminPassword string


var varVMNicName = 'nic-${toLower(parVmName)}'
var varVMFullName = 'vm-${parVmName}'
var varOSDiskName = 'disk-${toLower(parVmName)}-OS'
var varVMUsername = '${toLower(parCustomerNamePrefix)}-admin'
var varImageReference = (parVmImageId != '' ? {
  
    id: parVmImageId
      } : {
    publisher: parVmImagePublisher
    offer: parVmImageOffer
    sku: parVmImageSku
    version: 'latest'
  } )


resource resNicPIP 'Microsoft.Network/publicIPAddresses@2023-09-01' = if (parVMPublicIP) {
  name: 'pip-${parCustomerNamePrefix}-${parVmName}'
  location: parVmLocation
  tags: {
    location: parVmLocation
    billingTier: 'AVD'
  }
  sku:{
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
    deleteOption: 'Delete'
  }
}  

resource resVMNic 'Microsoft.Network/networkInterfaces@2021-02-01' = {
  name: varVMNicName
  location: parVmLocation
  tags: {
    location: parVmLocation
  }
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: { 
          privateIPAllocationMethod:  parNicStaticPrivateIpAssignment
          privateIPAddress: parNicStaticPrivateIpAssignment == 'Static' ? parNicStaticPrivateIpAddress : null
          privateIPAddressVersion: parNicStaticPrivateIpAssignment == 'Static' ? 'Ipv4' : null
          publicIPAddress: parVMPublicIP == false ? null : {
            id: resNicPIP.id
          }
          subnet: {
            id: parSubnetId
          }
        }
      }
    ]
    
    dnsSettings: empty(parNicDNSServers) ? null : {
      dnsServers: parNicDNSServers
    }
  }
}


resource resVm 'Microsoft.Compute/virtualMachines@2021-04-01' = {
  name: varVMFullName
  location: parVmLocation
  tags: {
    location: parVmLocation
    patchSchedule: parVmTagPatchSchedule
    osType: parTagVmOsType
    managedBy: parTagVmManagedBy
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    hardwareProfile: {
      vmSize: parVmSize
    }
    osProfile: parVMOSDiskCreateOption != 'attach' ? { 
      computerName: parVmName
      adminUsername: varVMUsername
      adminPassword: parVmAdminPassword
      windowsConfiguration: {
        enableAutomaticUpdates: parVmAutomaticUpdatesEnabled
        provisionVMAgent: true
        patchSettings: {
          patchMode: (parVmAutomaticUpdatesEnabled == true ? 'AutomaticByOS' : 'Manual')
        }
      }
    } : null
   
    licenseType: parVmLicenseType
    storageProfile: {
      imageReference: (parVMOSDiskCreateOption == 'fromImage') ? varImageReference  : null 
      osDisk: (parVmDiskType == 'Ephemeral') ? {
        diffDiskSettings: {
          option: 'Local'
          placement: parVmDiffDiskSettingsPlacement
        }
        caching: 'ReadOnly'
        createOption: parVMOSDiskCreateOption
      } : {
        name: varOSDiskName
        createOption: parVMOSDiskCreateOption
        osType: parVMOSType
        diskSizeGB: parVMOsDiskSizeGB
        deleteOption: parVMOsDiskDeleteOption
        managedDisk: (parVMOSDiskCreateOption == 'attach') ? {
          id: parVMOSAttachDiskId
        } : {
          storageAccountType: 'StandardSSD_LRS'
        }
      }
      dataDisks: empty(parVmDataDisks) ? null : parVmDataDisks
    }
      
    networkProfile: {
      networkInterfaces: [
        {
          id: resVMNic.id
          properties: {
          deleteOption: parVMNicDeleteOption
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
    securityProfile: (!parVmSecure ? null : {
      uefiSettings: {
        secureBootEnabled: true
        vTpmEnabled: true
      }
      securityType: parVmSecure ? 'TrustedLaunch' : 'Standard'
    })
  }
}
output outVMName string = resVm.name
output outVMNic  string = resVMNic.name
output outVMOSDisk string = resVm.properties.storageProfile.osDisk.name
output outVMUsername string = parVMOSDiskCreateOption != 'attach' ? resVm.properties.osProfile.adminUsername : 'Attached from snapshot use that vm password'
output outPublicIP string = parVMPublicIP == true ? resNicPIP.properties.ipAddress : 'No public ip'
output outLocalIp string = resVMNic.properties.ipConfigurations[0].properties.privateIPAddress

