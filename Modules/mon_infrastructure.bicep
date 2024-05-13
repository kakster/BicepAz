param parLogAnalyticsWorkspaceLocation string = resourceGroup().location

@description('Name of logAnalytics workspace')
param parLogAnalyticsWorkspaceName string

@description('only two type are allowed.')
@allowed([
  'Standard'
  'PerGB2018'
])
param parLogAnalyticsWorkspaceSKU string = 'PerGB2018'

@description('No of days of retention, 90 days is free if running with sentinel. Capped to 365 Upper limit is 730')
@minValue(30)
@maxValue(365)
param parLogAnalyticsWorkspaceLogRetentionDays int = 90

param parActionGroupName string

@maxLength(12)
param parActionGroupShortName string

@description('Add all the emailadresses that should be alterted in the following format {emailaddress}')
param parEmailRecipients array 


@allowed([
  'AgentHealthAssessment'
  'AntiMalware'
  'ChangeTracking'
  'Security'
  'SecurityInsights'
  'ServiceMap'
  'SQLAdvancedThreatProtection'
  'SQLVulnerabilityAssessment'
  'SQLAssessment'
  'Updates'
  'VMInsights'
])
@sys.description('Solutions that will be added to the Log Analytics Workspace.')
param parLogAnalyticsWorkspaceSolutions array = [
  'AgentHealthAssessment'
  'AntiMalware'
  'ChangeTracking'
  'Security'
  'SecurityInsights'
  'SQLAdvancedThreatProtection'
  'SQLVulnerabilityAssessment'
  'SQLAssessment'
  'Updates'
  'VMInsights'
]

@sys.description('Set Parameter to true to use Sentinel Classic Pricing Tiers, following changes introduced in July 2023 as documented here: https://learn.microsoft.com/azure/sentinel/enroll-simplified-pricing-tier.')
param parUseSentinelClassicPricingTiers bool = false


// Module beginning.

resource resLogAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' /*existing*/ = {
  name: parLogAnalyticsWorkspaceName
  location: parLogAnalyticsWorkspaceLocation
  tags: {
    location: parLogAnalyticsWorkspaceLocation
  }
  properties: {
    retentionInDays: parLogAnalyticsWorkspaceLogRetentionDays
    sku: {
      name: parLogAnalyticsWorkspaceSKU
    }
  }
}


resource resActionGroup 'Microsoft.Insights/actionGroups@2022-06-01' = {
  name: parActionGroupName
  location: 'global'
  properties: {
    groupShortName: parActionGroupShortName
    enabled: true
    emailReceivers: parEmailRecipients
    smsReceivers: []
    webhookReceivers: []
    itsmReceivers: []
    azureAppPushReceivers: []
    automationRunbookReceivers: []
    voiceReceivers: []
    logicAppReceivers: []
    azureFunctionReceivers: []
  }
}


//need to find out which solutions are needed.

/*
resource resLogAnalyticsWorkspaceSolutions 'Microsoft.OperationsManagement/solutions@2015-11-01-preview' = [for solution in parLogAnalyticsWorkspaceSolutions: {
  name: '${solution}(${resLogAnalyticsWorkspace.name})'
  location: parLogAnalyticsWorkspaceLocation
  tags: {
    location: parLogAnalyticsWorkspaceLocation
  }
  properties: solution == 'SecurityInsights' ? {
    workspaceResourceId: resLogAnalyticsWorkspace.id
    sku: parUseSentinelClassicPricingTiers ? null : {
      name: 'Unified'
    }
  } : {
    workspaceResourceId: resLogAnalyticsWorkspace.id
  }
  plan: {
    name: '${solution}(${resLogAnalyticsWorkspace.name})'
    product: 'OMSGallery/${solution}'
    publisher: 'Microsoft'
    promotionCode: ''
  }
}]
*/

output outLogAnalyticsWorkpaceName string = resLogAnalyticsWorkspace.name
output outLogAnalyticsWorkspaceId string = resLogAnalyticsWorkspace.id
output outLogAnalyticsSolutions array = parLogAnalyticsWorkspaceSolutions
output outResActionGroupName string = resActionGroup.name
output outResActionGroupId string = resActionGroup.id
