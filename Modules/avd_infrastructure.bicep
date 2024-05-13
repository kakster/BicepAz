param parLocation string
param parCustomerNamePrefix string
param parAVDHostPoolName string
param parTimeNow string = utcNow('d')
param parAVDSessionHostVMAADJoin bool
param parAVDApplicationGroupName string
param parAVDWorkspaceName string
param parAVDWorkSpaceFriendlyName string

@allowed([
  'Desktop'
  'RemoteApp'
])
param parApplicationGroupType string

@description('Friendly Name of the Host Pool, this is visible via the AVD client')
param parAVDHostPoolFriendlyName string

@description('Expiration time for the HostPool registration token. This must be up to 30 days from todays date.')
var varAVDTokenExpirationTime = dateTimeAdd(parTimeNow,'P20D')

@allowed([
  'BYODesktop'
  'Personal'
  'Pooled'
])
param parAVDHostPoolType string = 'Pooled'

@allowed([
  'BreadthFirst'
  'DepthFirst'
  'Persistent'
])
param parAVDLoadBalancerType string = 'BreadthFirst'

@allowed([
  'Desktop'
  'None'
  'RailApplications'
])
param parAVDPreferredAppGroupType string = 'Desktop'

//DiagnosticSettings
@description('If true it enalbes diagnostic logging for hostpool')
param parEnableMonitoring bool
param parLogAnalyticsWorkSpaceId string



resource resAVDHostpool 'Microsoft.DesktopVirtualization/hostPools@2023-09-05' = {
  name: parAVDHostPoolName
  location: parLocation
  properties: {
    friendlyName: parAVDHostPoolFriendlyName
    hostPoolType: parAVDHostPoolType
    loadBalancerType: parAVDLoadBalancerType
    customRdpProperty: parAVDSessionHostVMAADJoin == true ? 'targetisaadjoined:i:1' : null
    preferredAppGroupType: parAVDPreferredAppGroupType
    registrationInfo: {
      registrationTokenOperation: 'Update'
      expirationTime: varAVDTokenExpirationTime
      token: null
    }
  }
}


//diagSettings for logAnalytics
resource resWorkspaceDiagnostic 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = if (parEnableMonitoring) {
  name: 'avd-logAnaltycs'
  scope: resAVDHostpool
  properties: {
    workspaceId: parLogAnalyticsWorkSpaceId
    logs: [
      {
        category: 'Checkpoint'
        enabled: true
        retentionPolicy: {
          enabled: true
          days: 0
        }
      }
      {
        category: 'Error'
        enabled: true
        retentionPolicy: {
          enabled: true
          days: 0
        }
      }
      {
        category: 'Management'
        enabled: true
        retentionPolicy: {
          enabled: true
          days: 0
        }
      }
      {
        category: 'Connection'
        enabled: false
        retentionPolicy: {
          enabled: true
          days: 0
        }
      }
      {
        category: 'HostRegistration'
        enabled: true
        retentionPolicy: {
          enabled: true
          days: 0
        }
      }
      {
        category: 'AgentHealthStatus'
        enabled: true
        retentionPolicy: {
          enabled: true
          days: 0
        }
      }
      {
        category: 'NetworkData'
        enabled: true
        retentionPolicy: {
          enabled: false
          days: 0
        }
      }
      {
        category: 'ConnectionGraphicsData'
        enabled: true
        retentionPolicy: {
          enabled: false
          days: 0
        }
      }
      {
        category: 'SessionHostManagement'
        enabled: true
        retentionPolicy: {
          enabled: true
          days: 0
        }
      }
    {
        category: 'AutoscaleEvaluationPooled'
        enabled: true
        retentionPolicy: {
            days: 0
            enabled: false
        }
    }
    ]
  }
}


resource resAVDApplicationGroup 'Microsoft.DesktopVirtualization/applicationGroups@2023-09-05' = {
  name: parAVDApplicationGroupName
  location: parLocation
  properties: {
    applicationGroupType: parApplicationGroupType
    description: 'Remote Desktop'
    friendlyName: parApplicationGroupType == 'Desktop' ? '${parCustomerNamePrefix} Desktop' : '${parCustomerNamePrefix} Remote Apps'
    hostPoolArmPath: resAVDHostpool.id
    showInFeed: true
  }
}

resource resAVDWorkspace 'Microsoft.DesktopVirtualization/workspaces@2023-09-05' = {
  name: parAVDWorkspaceName
  location: parLocation
  properties: {
    friendlyName: parAVDWorkSpaceFriendlyName
    description: 'Users can connect to various application in full desktop'
    applicationGroupReferences: [ 
      resAVDApplicationGroup.id
    ]
  } 
}



