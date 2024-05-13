param parLocation string = resourceGroup().location
param parCustomerNamePrefix string
param parLogAnalyticsWorkspaceName string
param parActionGroupName string
param parActionGroupId string = resourceId('Microsoft.Insights/actionGroups', parActionGroupName)
param parCounters array = [
  {
    counterName: '% Free Space'
    instanceName: '*'
    intervalSeconds: '300'
    objectName: 'LogicalDisk'
  }
  {
    counterName: 'Avg. Disk sec/Read'
    instanceName: '*'
    intervalSeconds: '60'
    objectName: 'LogicalDisk'
  }
  {
    counterName: 'Avg. Disk sec/Write'
    instanceName: '*'
    intervalSeconds: '60'
    objectName: 'LogicalDisk'
  }
  {
    counterName: '% Free Space'
    instanceName: 'C:'
    intervalSeconds: 300
    objectName: 'LogicalDisk'
  }
  {
    counterName: 'Avg. Disk Queue Length'
    instanceName: 'C:'
    intervalSeconds: 60
    objectName: 'LogicalDisk'
  }
  {
    counterName: 'Avg. Disk sec/Transfer'
    instanceName: 'C:'
    intervalSeconds: 60
    objectName: 'LogicalDisk'
  }
  {
    counterName: 'Current Disk Queue Length'
    instanceName: 'C:'
    intervalSeconds: 60
    objectName: 'LogicalDisk'
  }
  {
    counterName: 'Current Disk Queue Length'
    instanceName: '*'
    intervalSeconds: '60'
    objectName: 'LogicalDisk'
  }
  {
    counterName: 'Disk Reads/sec'
    instanceName: '*'
    intervalSeconds: '60'
    objectName: 'LogicalDisk'
  }
  {
    counterName: 'Disk Transfers/sec'
    instanceName: '*'
    intervalSeconds: '60'
    objectName: 'LogicalDisk'
  }
  {
    counterName: 'Disk Writes/sec'
    instanceName: '*'
    intervalSeconds: '60'
    objectName: 'LogicalDisk'
  }
  {
    counterName: 'Free Megabytes'
    instanceName: '*'
    intervalSeconds: '300'
    objectName: 'LogicalDisk'
  }
  {
    counterName: 'Available Mbytes'
    instanceName: '*'
    intervalSeconds: 300
    objectName: 'Memory'
  }
  {
    counterName: 'Bytes Received/sec'
    instanceName: '*'
    intervalSeconds: '60'
    objectName: 'Network Adapter'
  }
  {
    counterName: 'Bytes Sent/sec'
    instanceName: '*'
    intervalSeconds: '60'
    objectName: 'Network Adapter'
  }
  {
    counterName: 'Avg. Disk Queue Length'
    instanceName: '*'
    intervalSeconds: 60
    objectName: 'PhysicalDisk'
  }
  {
    counterName: 'Avg. Disk sec/Read'
    instanceName: '*'
    intervalSeconds: 60
    objectName: 'PhysicalDisk'
  }
  {
    counterName: 'Avg. Disk sec/Transfer'
    instanceName: '*'
    intervalSeconds: 60
    objectName: 'PhysicalDisk'
  }
  {
    counterName: 'Avg. Disk sec/Write'
    instanceName: '*'
    intervalSeconds: 60
    objectName: 'PhysicalDisk'
  }
  {
    counterName: '% Processor Time'
    instanceName: '_Total'
    intervalSeconds: 60
    objectName: 'Processor Information'
  }
  {
    allInstances: false
    counterName: '% Processor Time'
    instanceName: '_Total'
    intervalSeconds: '60'
    objectName: 'Processor'
  }
]
param parEvents array = [
  {
    eventLogName: 'System'
    eventTypes: [
      {
        eventType: 'Error'
      }
    ]
  }
  {
    eventLogName: 'Application'
    eventTypes: [
      {
        eventType: 'Error'
      }
    ]
  }
]
param parScheduledQueryRules array = [
  {
    name: 'daily-log-cap-reached'
    query: 'Operation | where Detail has "OverQuota"'
  }
  {
    name: 'daily-log-ingestion-reached'
    query: '_LogOperation | where Category == "Ingestion" | where Operation == "Ingestion rate" | where Level == "Warning"'
  }
  /*{
    name: 'autorun-services'
    query: 'let utcoffset = 2h; ConfigurationData | where ConfigDataType == "WindowsServices" and SvcStartupType == "Auto" and (SvcState != "Running") | where SvcDisplayName !contains "Windows Update" | where SvcDisplayName !contains "Background Intelligent Transfer Service" | where SvcDisplayName !contains "Software Protection" | where SvcDisplayName !contains "IaasVmProvider" | where SvcDisplayName !contains "Microsoft Edge-opdatering-tjeneste (edgeupdate)" | where SvcDisplayName !contains "Microsoft Edge Update Service (edgeupdate)" | where SvcDisplayName !contains "Google Update Service (gupdate)" | where SvcDisplayName !contains "Google Update Tjeneste (gupdate)" | where SvcDisplayName !contains "Downloaded Maps Manager" | where SvcDisplayName !contains "Remote Registry" | where SvcDisplayName !contains "Windows Biometric Service" | where SvcDisplayName !contains "Shell Hardware Detection" | where SvcDisplayName !contains "NetBackup Bare Metal Restore Boot Server" | where SvcDisplayName !contains "Microsoft .NET Framework NGEN v4.0.30319_X64" | where SvcDisplayName !contains "Microsoft .NET Framework NGEN v4.0.30319_X86" | where SvcDisplayName !contains "EPMaintenanceService" | where SvcDisplayName !contains "Concierge Booking Repository Service" | where SvcDisplayName !contains "Diagnostic Policy Service" | where SvcDisplayName !contains "User Access Logging Service" | where SvcDisplayName !contains "Ivanti Security Controls Agent" | where SvcDisplayName !contains "Tile Data model server" | where SvcDisplayName !contains "TSM SQL Scheduler" | where SvcDisplayName !contains "TSM FILE Scheduler" | where SvcDisplayName !contains "Microsoft SQL Data Sync 2.0" | where SvcDisplayName !contains "SQL Server Agent (SPSTST)" | where SvcDisplayName !contains "Nemkonto" | where SvcDisplayName !contains "AppFabric Caching Service" | where SvcDisplayName !contains "XML Update Service" | where SvcDisplayName !contains "Windows Modules Installer" | where SvcDisplayName !contains "HPWSProAdapter" | where SvcDisplayName !contains "OracleDBConsoleCCTL" | where SvcDisplayName !contains "Delivery Optimization" | where SvcDisplayName !contains "VM Guest Health Agent" | where SvcDisplayName !contains "Sync Host_" | where SvcDisplayName !contains "Connected Devices Platform User Service_" | where SvcDisplayName !contains "Windows Push Notifications User Service_" | extend localTimestamp = TimeGenerated + utcoffset | project localTimestamp, Computer, SvcDisplayName, SvcState | order by localTimestamp desc | summarize arg_max(localTimestamp, *) by Computer, SvcDisplayName'
  }*/
  {
    name: 'freespace-02'
    query: 'let setvalue = 2; InsightsMetrics | where TimeGenerated > ago(1h) | where Namespace == "LogicalDisk" and Name == "FreeSpacePercentage" | summarize FreeSpace = min(Val) by Computer | where FreeSpace < setvalue'
  }
  {
    name: 'freespace-04'
    query: 'let setvalue = 4; InsightsMetrics | where TimeGenerated > ago(1h) | where Namespace == "LogicalDisk" and Name == "FreeSpacePercentage" | summarize FreeSpace = min(Val) by Computer | where FreeSpace < setvalue'
  }
  {
    name: 'freespace-15'
    query: 'let setvalue = 15; InsightsMetrics | where TimeGenerated > ago(1h) | where Namespace == "LogicalDisk" and Name == "FreeSpacePercentage" | summarize FreeSpace = min(Val) by Computer | where FreeSpace < setvalue'
  }
  {
    name: 'memory-free'
    query: 'let utcoffset = 2h; let setvalue = 10; InsightsMetrics | where Namespace == "Memory" | extend m=parse_json(Tags) | extend memoryTotalGB = toint(m.["vm.azm.ms/memorySizeMB"]) | extend memoryPercentageFree = Val * 100 / memoryTotalGB | where memoryPercentageFree < setvalue'
  }
  {
    name: 'wvd-unhealthy-host'
    query: 'WVDAgentHealthStatus | where EndpointState != "Healthy"'
  }
]
param metricAlerts array = [
  {
    name: 'cpucredits-static'
    criteria: [
      {
        name: '1st criterion'
        metricName: 'CPU Credits Remaining'
        dimensions: []
        operator: 'LessThan'
        threshold: '10'
        timeAggregation: 'Average'
      }
    ]
  }
  {
    name: 'cpu-static'
    criteria: [
      {
        name: '1st criterion'
        metricName: 'Percentage CPU'
        dimensions: []
        operator: 'GreaterThan'
        threshold: '90'
        timeAggregation: 'Average'
      }
    ]
  }
]

resource resCounter 'Microsoft.OperationalInsights/workspaces/dataSources@2020-08-01' = [for item in parCounters: {
  name: '${parLogAnalyticsWorkspaceName}/${uniqueString(item.objectName, item.instanceName, item.counterName)}'
  kind: 'WindowsPerformanceCounter'
  properties: item
}]

resource resDataSource 'Microsoft.OperationalInsights/workspaces/dataSources@2020-08-01' = [for item in parEvents: {
  name: '${parLogAnalyticsWorkspaceName}/${uniqueString(item.eventLogName)}'
  kind: 'WindowsEvent'
  properties: item
}]

resource resScheduledQueryRule 'Microsoft.Insights/scheduledQueryRules@2021-02-01-preview' = [for item in parScheduledQueryRules: {
  name: 'alert-${parCustomerNamePrefix}-${item.name}'
  location: parLocation
  properties: {
    enabled: true
    severity: 1
    evaluationFrequency: 'PT5M'
    windowSize: 'PT15M'
    scopes: [
      resourceId('Microsoft.OperationalInsights/workspaces', parLogAnalyticsWorkspaceName)
    ]
    criteria: {
      allOf: [
        {
          query: item.query
          timeAggregation: 'Count'
          operator: 'GreaterThan'
          threshold: 0
          failingPeriods: {
            numberOfEvaluationPeriods: 1
            minFailingPeriodsToAlert: 1
          }
        }
      ]
    }
    actions: {
      actionGroups: [
        parActionGroupId
      ]
    }
  }
}]

resource resMetricAlert 'Microsoft.Insights/metricAlerts@2018-03-01' = [for item in metricAlerts: {
  name: 'alert-${parCustomerNamePrefix}-${item.name}'
  location: 'global'
  properties: {
    enabled: true
    severity: 1
    scopes: [
      subscription().id
    ]
    targetResourceType: 'Microsoft.Compute/virtualMachines'
    targetResourceRegion: parLocation
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria'
      allOf: item.criteria
    }
    actions: [
      {
        actionGroupId: parActionGroupId
      }
    ]
  }
}]
