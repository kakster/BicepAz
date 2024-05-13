param parLocation string = resourceGroup().location
param parCustomerNamePrefix string

@description('Specifies the Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. Get it by using Get-AzSubscription cmdlet.')
param parTenantId string = subscription().tenantId

@description('Specifies whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault.')
param parEnabledForDeployment bool = false

param parEnableRbacAuthorization bool = true

@description('Specifies whether the key vault is a standard vault or a premium vault.')
@allowed([
  'standard'
  'premium'
])
param parSkuName string = 'standard'

param parSecretName string 
@description('default lokal admin for all VMs')
@secure()
param parSecretVMAdministrator string



resource resKeyVault 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: 'kv-${parCustomerNamePrefix}'
  location: parLocation
  properties: {
    enabledForDeployment: parEnabledForDeployment
    enabledForTemplateDeployment: true
    enabledForDiskEncryption: true
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    tenantId: parTenantId
    enableRbacAuthorization: parEnableRbacAuthorization
    accessPolicies: parEnableRbacAuthorization ? null : [
      {
        tenantId: parTenantId
        objectId: 'objectId'
        permissions: {
          keys: [
            'get'
          ]
          secrets: [
            'list'
            'get'
          ]
        }
      }
    ]
    sku: {
      name: parSkuName
      family: 'A'
    }
  }
}

resource resKeyVaultSecret 'Microsoft.KeyVault/vaults/secrets@2019-09-01' = if (!empty(parSecretName)) {
  parent: resKeyVault
  name: parSecretName
  properties: {
    value: parSecretVMAdministrator
  }
}


/*
resource resKeyVaultDiagnosticSettings 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  name: 'logAnalytics'
  scope: keyVault
  properties: {
    workspaceId: workspace.id
    metrics: [
      {
        category: 'AllMetrics'
        enabled: true
        retentionPolicy: {
          enabled: false
          days: 400
        }
      }
    ]
    logs: [
      {
        category: 'AuditEvent'
        enabled: true
        retentionPolicy: {
          enabled: false
          days: 400
        }
      }
    ]
  }
  dependsOn: [

  ]
}
*/
output outKeyVaultName string = resKeyVault.name
