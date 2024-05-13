param parManagementGroupName string
param parParentManagementGroupName string
param parDisplayName string

resource resManagementGroup 'Microsoft.Management/managementGroups@2021-04-01' = {
  name: parManagementGroupName
  scope: tenant()
  properties: {
    details: {
      parent: {
        id: resourceId('managementGroups',parParentManagementGroupName)
      }
    }
    displayName: parDisplayName
  }
}
