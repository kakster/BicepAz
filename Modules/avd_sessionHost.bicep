param parLocation string = resourceGroup().location
param parCustomerNamePrefix string

param parAdminUsername string = '${parCustomerNamePrefix}-admin'
@secure()
param parAdminPassword string

param parAVDHostPoolName string 
param parAVDSessionHostVMNamePrefix string 
param parAVDSessionHostCurrentInstances int
param parAVDSessionHostNumberOfInstancesToDeploy int
param parAVDSessionHostSecure bool

param parSessionHostVMSize string
param parNicSubnetId string

param parAvailabilitySetSKU string = 'aligned'
//hostPool info



//vm param
param parAVDSessionHostVMAADJoin bool 
param parAVDSessionMDMEnroll bool
param parDomainJoinDomainName string
param parDomainJoinOUPath string 
param parDomainJoinUsername string
param parDomainJoinPassword string 
param parDomainJoinOptions int = 3
param parModulesUrl string = 'https://wvdportalstorageblob.blob.${environment().suffixes.storage}/galleryartifacts/Configuration_8-16-2021.zip'
//'https://wvdportalstorageblob.blob.core.windows.net/galleryartifacts/Configuration_8-16-2021.zip'


param parVMDiskType string = 'Premium_LRS'

//get resourceGallery
param parAVDVMImageTemplateResourceId string

resource resNic 'Microsoft.Network/networkInterfaces@2020-06-01' = [for i in range(parAVDSessionHostCurrentInstances, parAVDSessionHostNumberOfInstancesToDeploy): {
  name: 'nic-${parAVDSessionHostVMNamePrefix}-${i + parAVDSessionHostCurrentInstances}'
 // name: 'nic-${parAVDSessionHostVMNamePrefix}-0'
  location: parLocation
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: parNicSubnetId
          }
        }
      }
    ]
  }
}
]

/*
resource resAvailabilitySet 'Microsoft.Compute/availabilitySets@2020-12-01' = {
  name: 'AVS-${parAVDSessionHostVMNamePrefix}'
  location: parLocation
  properties: {
    platformFaultDomainCount: 2
    platformUpdateDomainCount: 10
  }
  sku: {
    name: parAvailabilitySetSKU
  }
}
*/

resource resSessionHostVM 'Microsoft.Compute/virtualMachines@2023-09-01' = [for i in range(0, parAVDSessionHostNumberOfInstancesToDeploy): {
  name: 'vm-${parAVDSessionHostVMNamePrefix}-${i + parAVDSessionHostCurrentInstances}'
  location: parLocation
  identity: parAVDSessionHostVMAADJoin ? {
    type: 'SystemAssigned'
  } : null
  properties: {
    licenseType: 'Windows_Client'
    hardwareProfile: {
      vmSize: parSessionHostVMSize
    }/*
    availabilitySet: {
      id: resAvailabilitySet.id
    }*/
    osProfile: {
      computerName: '${parAVDSessionHostVMNamePrefix}-${i + parAVDSessionHostCurrentInstances}'
      adminUsername: parAdminUsername
      adminPassword: parAdminPassword
      windowsConfiguration: {
        enableAutomaticUpdates: false
        enableVMAgentPlatformUpdates: true
        provisionVMAgent: true
        patchSettings: {
          patchMode: 'Manual'
        }
      }
    }
    storageProfile: {
      osDisk: {
        name: 'disk-${parAVDSessionHostVMNamePrefix}-${i + parAVDSessionHostCurrentInstances}'
        managedDisk: {
          storageAccountType: parVMDiskType
        }
        createOption: 'FromImage'
        //osType: 'Windows'
        deleteOption: 'Delete'
      }
      imageReference: {
        id: parAVDVMImageTemplateResourceId
      }
      dataDisks: []
    }
    networkProfile: {
      networkInterfaces: [
        {
          properties: {
            deleteOption: 'Delete'
          }
          id: resourceId('Microsoft.Network/networkInterfaces', resNic[i].name)
          
        }
      ]
    }
    securityProfile:  {
      securityType: parAVDSessionHostSecure ? 'TrustedLaunch' : 'Standard'
      uefiSettings: parAVDSessionHostSecure ? {
        vTpmEnabled: true
        secureBootEnabled: true
      } : null
    } 
  }
}]


resource aadLoginForWindows 'Microsoft.Compute/virtualMachines/extensions@2021-04-01' = [for i in range(0, parAVDSessionHostNumberOfInstancesToDeploy): if (parAVDSessionHostVMAADJoin) {
  name: 'AADLoginForWindows'
  parent: resSessionHostVM[i]
  location: parLocation
  properties: {
    publisher: 'Microsoft.Azure.ActiveDirectory'
    type: 'AADLoginForWindows'
    typeHandlerVersion: '1.0'
    autoUpgradeMinorVersion: true
    settings: !parAVDSessionMDMEnroll ? null : {
      mdmId: '0000000a-0000-0000-c000-000000000000'
    }
  }
}
]



resource resSessionHostDomainJoin 'Microsoft.Compute/virtualMachines/extensions@2020-06-01' = [for i in range(0, parAVDSessionHostNumberOfInstancesToDeploy): if (!parAVDSessionHostVMAADJoin) {
  name: 'JoinDomain'
  parent: resSessionHostVM[i]
  location: parLocation
  properties: {
    publisher: 'Microsoft.Compute'
    type: 'JsonADDomainExtension'
    typeHandlerVersion: '1.3'
    autoUpgradeMinorVersion: true
    settings: {
      name: parDomainJoinDomainName
      ouPath: parDomainJoinOUPath
      user: parDomainJoinUsername
      restart: true
      options: parDomainJoinOptions
    }
    protectedSettings: {
      password: parDomainJoinPassword
    }
  }

  dependsOn: [
    resSessionHostVM[i]
  ]
}]


// Run this if we are Azure AD joining the session hosts - no intune support

resource resHostPoolToken 'Microsoft.DesktopVirtualization/hostPools@2021-01-14-preview' existing = {
  name: parAVDHostPoolName
}

resource resSessionHostAVDAgent 'Microsoft.Compute/virtualMachines/extensions@2020-06-01' = [for i in range(0, parAVDSessionHostNumberOfInstancesToDeploy): if (parAVDSessionHostVMAADJoin) {
  name: '${resSessionHostVM[i].name}/AddSessionHost'
  location: parLocation
  properties: {
    publisher: 'Microsoft.Powershell'
    type: 'DSC'
    typeHandlerVersion: '2.73'
    autoUpgradeMinorVersion: true
    settings: {
      modulesUrl: parModulesUrl
      configurationFunction: 'Configuration.ps1\\AddSessionHost'
      properties: {
        hostPoolName: resHostPoolToken.name
        registrationInfoToken: resHostPoolToken.properties.registrationInfo.token
        aadJoin: parAVDSessionHostVMAADJoin
      }
    }
  }

  /*dependsOn: [
    sessionHostDomainJoin[i]
  ]*/
}]

