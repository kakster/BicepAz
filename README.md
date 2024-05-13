# AVD
AVD start

Created fundament
    - vNet
    - subnet
    - logAnalytics
    - goldenImage
    - avd infrastructure
    - keyVault
    - log analytics alerting / action group (mon_infrastructure.bicep + vm_metrics) 

Working on

    Loganalytics for the fundament
    - ps scripting
    
    - check metrics from management.bicep from root

for now missing

    - avd_infrastructre bicep has hardcoded friendlyNames
    - Monitoring Solution
        - logging.bicep
        - missing query; autorun-services in Modules/vm_metrics.bicep
    - rbac module.
        keyVault
    - Locks? should they be there?
    - change to vm module for building AVD?
    - existing function? for landingzone referral
    - Policies
        FS Logix
    - use azure imagebuilder. https://github.com/Azure/azvmimagebuilder/tree/main/quickquickstarts
    - pipelines / git hub actions