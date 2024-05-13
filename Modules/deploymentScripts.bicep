param parLocation string = resourceGroup().location
param parScriptContent string 

resource deploymentScript 'Microsoft.Resources/deploymentScripts@2023-08-01' = {
  name: 'inlineCLI'
  location: parLocation
  kind: 'AzureCLI'
  properties: {
    azCliVersion: '2.52.0'
    arguments: name
    scriptContent: parScriptContent
    retentionInterval: 'PT1H'
  }
}
