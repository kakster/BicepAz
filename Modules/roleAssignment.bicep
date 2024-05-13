// Scope
targetScope = 'resourceGroup'

// Parameters
@description('Names of Azure Rbac Roles')
@allowed([
'Access Review Operator Service Role'
'AcrDelete'
'AcrImageSigner'
'AcrPull'
'AcrPush'
'AcrQuarantineReader'
'AcrQuarantineWriter'
'AgFood Platform Sensor Partner Contributor'
'AgFood Platform Service Admin'
'AgFood Platform Service Contributor'
'AgFood Platform Service Reader'
'AnyBuild Builder'
'API Management Developer Portal Content Editor'
'API Management Service Contributor'
'API Management Service Operator Role'
'API Management Service Reader Role'
'App Configuration Data Owner'
'App Configuration Data Reader'
'Application Group Contributor'
'Application Insights Component Contributor'
'Application Insights Snapshot Debugger'
'Attestation Contributor'
'Attestation Reader'
'Automation Contributor'
'Automation Job Operator'
'Automation Operator'
'Automation Runbook Operator'
'Autonomous Development Platform Data Contributor (Preview)'
'Autonomous Development Platform Data Owner (Preview)'
'Autonomous Development Platform Data Reader (Preview)'
'Avere Contributor'
'Avere Operator'
'Azure Arc Enabled Kubernetes Cluster User Role'
'Azure Arc Kubernetes Admin'
'Azure Arc Kubernetes Cluster Admin'
'Azure Arc Kubernetes Viewer'
'Azure Arc Kubernetes Writer'
'Azure Arc ScVmm Administrator role'
'Azure Arc ScVmm Private Cloud User'
'Azure Arc ScVmm Private Clouds Onboarding'
'Azure Arc ScVmm VM Contributor'
'Azure Arc VMware Administrator role '
'Azure Arc VMware Private Cloud User'
'Azure Arc VMware Private Clouds Onboarding'
'Azure Arc VMware VM Contributor'
'Azure Center for SAP solutions administrator'
'Azure Center for SAP solutions reader'
'Azure Center for SAP solutions service role'
'Azure Connected Machine Onboarding'
'Azure Connected Machine Resource Administrator'
'Azure Connected Machine Resource Manager'
'Azure Connected SQL Server Onboarding'
'Azure Digital Twins Data Owner'
'Azure Digital Twins Data Reader'
'Azure Event Hubs Data Owner'
'Azure Event Hubs Data Receiver'
'Azure Event Hubs Data Sender'
'Azure Kubernetes Fleet Manager Contributor Role'
'Azure Kubernetes Fleet Manager RBAC Admin'
'Azure Kubernetes Fleet Manager RBAC Cluster Admin'
'Azure Kubernetes Fleet Manager RBAC Reader'
'Azure Kubernetes Fleet Manager RBAC Writer'
'Azure Kubernetes Service Cluster Admin Role'
'Azure Kubernetes Service Cluster Monitoring User'
'Azure Kubernetes Service Cluster User Role'
'Azure Kubernetes Service Contributor Role'
'Azure Kubernetes Service Policy Add-on Deployment'
'Azure Kubernetes Service RBAC Admin'
'Azure Kubernetes Service RBAC Cluster Admin'
'Azure Kubernetes Service RBAC Reader'
'Azure Kubernetes Service RBAC Writer'
'Azure Maps Contributor'
'Azure Maps Data Contributor'
'Azure Maps Data Reader'
'Azure Maps Search and Render Data Reader'
'Azure Relay Listener'
'Azure Relay Owner'
'Azure Relay Sender'
'Azure Service Bus Data Owner'
'Azure Service Bus Data Receiver'
'Azure Service Bus Data Sender'
'Azure Spring Apps Connect Role'
'Azure Spring Apps Remote Debugging Role'
'Azure Spring Cloud Config Server Contributor'
'Azure Spring Cloud Config Server Reader'
'Azure Spring Cloud Data Reader'
'Azure Spring Cloud Service Registry Contributor'
'Azure Spring Cloud Service Registry Reader'
'Azure Stack Registration Owner'
'Azure Traffic Controller Configuration Manager'
'Azure VM Managed identities restore Contributor'
'AzureML Compute Operator'
'AzureML Data Scientist'
'AzureML Metrics Writer (preview)'
'AzureML Registry User'
'Backup Contributor'
'Backup Operator'
'Backup Reader'
'Billing Reader'
'BizTalk Contributor'
'Blockchain Member Node Access (Preview)'
'Blueprint Contributor'
'Blueprint Operator'
'CDN Endpoint Contributor'
'CDN Endpoint Reader'
'CDN Profile Contributor'
'CDN Profile Reader'
'Chamber Admin'
'Chamber User'
'Classic Network Contributor'
'Classic Storage Account Contributor'
'Classic Storage Account Key Operator Service Role'
'Classic Virtual Machine Contributor'
'ClearDB MySQL DB Contributor'
'Code Signing Certificate Profile Signer'
'Code Signing Identity Verifier'
'Cognitive Services Contributor'
'Cognitive Services Custom Vision Contributor'
'Cognitive Services Custom Vision Deployment'
'Cognitive Services Custom Vision Labeler'
'Cognitive Services Custom Vision Reader'
'Cognitive Services Custom Vision Trainer'
'Cognitive Services Data Reader (Preview)'
'Cognitive Services Face Recognizer'
'Cognitive Services Immersive Reader User'
'Cognitive Services Language Owner'
'Cognitive Services Language Reader'
'Cognitive Services Language Writer'
'Cognitive Services LUIS Owner'
'Cognitive Services LUIS Reader'
'Cognitive Services LUIS Writer'
'Cognitive Services Metrics Advisor Administrator'
'Cognitive Services Metrics Advisor User'
'Cognitive Services OpenAI Contributor'
'Cognitive Services OpenAI User'
'Cognitive Services QnA Maker Editor'
'Cognitive Services QnA Maker Reader'
'Cognitive Services Speech Contributor'
'Cognitive Services Speech User'
'Cognitive Services User'
'Collaborative Data Contributor'
'Collaborative Runtime Operator'
'Compute Gallery Sharing Admin'
'Contributor'
'Contributor with resource lock rights'
'Cosmos DB Account Reader Role'
'Cosmos DB Operator'
'CosmosBackupOperator'
'CosmosRestoreOperator'
'Cost Management Contributor'
'Cost Management Reader'
'Data Box Contributor'
'Data Box Reader'
'Data Factory Contributor'
'Data Labeling - Labeler'
'Data Lake Analytics Developer'
'Data Operator for Managed Disks'
'Data Purger'
'Deployment Environments User'
'Desktop Virtualization Application Group Contributor'
'Desktop Virtualization Application Group Reader'
'Desktop Virtualization Contributor'
'Desktop Virtualization Host Pool Contributor'
'Desktop Virtualization Host Pool Reader'
'Desktop Virtualization Power On Contributor'
'Desktop Virtualization Power On Off Contributor'
'Desktop Virtualization Reader'
'Desktop Virtualization Session Host Operator'
'Desktop Virtualization User'
'Desktop Virtualization User Session Operator'
'Desktop Virtualization Virtual Machine Contributor'
'Desktop Virtualization Workspace Contributor'
'Desktop Virtualization Workspace Reader'
'DevCenter Dev Box User'
'DevCenter Project Admin'
'Device Provisioning Service Data Contributor'
'Device Provisioning Service Data Reader'
'Device Update Administrator'
'Device Update Content Administrator'
'Device Update Content Reader'
'Device Update Deployments Administrator'
'Device Update Deployments Reader'
'Device Update Reader'
'DevTest Labs User'
'DICOM Data Owner'
'DICOM Data Reader'
'Disk Backup Reader'
'Disk Pool Operator'
'Disk Restore Operator'
'Disk Snapshot Contributor'
'DNS Resolver Contributor'
'DNS Zone Contributor'
'DocumentDB Account Contributor'
'Domain Services Contributor'
'Domain Services Reader'
'Elastic SAN Owner'
'Elastic SAN Reader'
'Elastic SAN Volume Group Owner'
'EventGrid Contributor'
'EventGrid Data Sender'
'EventGrid EventSubscription Contributor'
'EventGrid EventSubscription Reader'
'Experimentation Administrator'
'Experimentation Contributor'
'Experimentation Metric Contributor'
'Experimentation Reader'
'FHIR Data Contributor'
'FHIR Data Converter'
'FHIR Data Exporter'
'FHIR Data Importer'
'FHIR Data Reader'
'FHIR Data Writer'
'FHIR SMART User'
'Grafana Admin'
'Grafana Editor'
'Grafana Viewer'
'Graph Owner'
'Guest Configuration Resource Contributor'
'HDInsight Cluster Operator'
'HDInsight Domain Services Contributor'
'Hierarchy Settings Administrator'
'Hybrid Server Onboarding'
'Hybrid Server Resource Administrator'
'Impact Reader'
'Impact Reporter'
'Integration Service Environment Contributor'
'Integration Service Environment Developer'
'Intelligent Systems Account Contributor'
'IoT Hub Data Contributor'
'IoT Hub Data Reader'
'IoT Hub Registry Contributor'
'IoT Hub Twin Contributor'
'Key Vault Administrator'
'Key Vault Certificates Officer'
'Key Vault Contributor'
'Key Vault Crypto Officer'
'Key Vault Crypto Service Encryption User'
'Key Vault Crypto User'
'Key Vault Reader'
'Key Vault Secrets Officer'
'Key Vault Secrets User'
'Knowledge Consumer'
'Kubernetes Cluster - Azure Arc Onboarding'
'Kubernetes Extension Contributor'
'Kubernetes Namespace User'
'Lab Assistant'
'Lab Contributor'
'Lab Creator'
'Lab Operator'
'Lab Services Contributor'
'Lab Services Reader'
'Load Test Contributor'
'Load Test Owner'
'Load Test Reader'
'Log Analytics Contributor'
'Log Analytics Reader'
'Logic App Contributor'
'Logic App Operator'
'Managed Application Contributor Role'
'Managed Application Operator Role'
'Managed Applications Reader'
'Managed HSM contributor'
'Managed Identity Contributor'
'Managed Identity Operator'
'Managed Services Registration assignment Delete Role'
'Management Group Contributor'
'Management Group Reader'
'Media Services Account Administrator'
'Media Services Live Events Administrator'
'Media Services Media Operator'
'Media Services Policy Administrator'
'Media Services Streaming Endpoints Administrator'
'Microsoft Sentinel Automation Contributor'
'Microsoft Sentinel Contributor'
'Microsoft Sentinel Playbook Operator'
'Microsoft Sentinel Reader'
'Microsoft Sentinel Responder'
'Microsoft.Kubernetes connected cluster role'
'Monitoring Contributor'
'Monitoring Data Reader'
'Monitoring Metrics Publisher'
'Monitoring Reader'
'Network Contributor'
'New Relic APM Account Contributor'
'Object Anchors Account Owner'
'Object Anchors Account Reader'
'Object Understanding Account Owner'
'Object Understanding Account Reader'
'Owner'
'PlayFab Contributor'
'PlayFab Reader'
'Policy Insights Data Writer (Preview)'
'Private DNS Zone Contributor'
'Project Babylon Data Curator'
'Project Babylon Data Reader'
'Project Babylon Data Source Administrator'
'Purview role 1 (Deprecated)'
'Purview role 2 (Deprecated)'
'Purview role 3 (Deprecated)'
'Quota Request Operator'
'Reader'
'Reader and Data Access'
'Redis Cache Contributor'
'Remote Rendering Administrator'
'Remote Rendering Client'
'Reservation Purchaser'
'Resource Policy Contributor'
'Role Based Access Control Administrator (Preview)'
'Scheduled Patching Contributor'
'Scheduler Job Collections Contributor'
'Schema Registry Contributor (Preview)'
'Schema Registry Reader (Preview)'
'Search Index Data Contributor'
'Search Index Data Reader'
'Search Service Contributor'
'Security Admin'
'Security Assessment Contributor'
'Security Detonation Chamber Publisher'
'Security Detonation Chamber Reader'
'Security Detonation Chamber Submission Manager'
'Security Detonation Chamber Submitter'
'Security Manager (Legacy)'
'Security Reader'
'Services Hub Operator'
'SignalR AccessKey Reader'
'SignalR App Server'
'SignalR REST API Owner'
'SignalR REST API Reader'
'SignalR Service Owner'
'SignalR/Web PubSub Contributor'
'Site Recovery Contributor'
'Site Recovery Operator'
'Site Recovery Reader'
'Spatial Anchors Account Contributor'
'Spatial Anchors Account Owner'
'Spatial Anchors Account Reader'
'SQL DB Contributor'
'SQL Managed Instance Contributor'
'SQL Security Manager'
'SQL Server Contributor'
'Storage Account Backup Contributor'
'Storage Account Contributor'
'Storage Account Key Operator Service Role'
'Storage Blob Data Contributor'
'Storage Blob Data Owner'
'Storage Blob Data Reader'
'Storage Blob Delegator'
'Storage File Data SMB Share Contributor'
'Storage File Data SMB Share Elevated Contributor'
'Storage File Data SMB Share Reader'
'Storage Queue Data Contributor'
'Storage Queue Data Message Processor'
'Storage Queue Data Message Sender'
'Storage Queue Data Reader'
'Storage Table Data Contributor'
'Storage Table Data Reader'
'Stream Analytics Query Tester'
'Support Request Contributor'
'Tag Contributor'
'Template Spec Contributor'
'Template Spec Reader'
'Test Base Reader'
'Traffic Manager Contributor'
'User Access Administrator'
'Video Indexer Restricted Viewer'
'Virtual Machine Administrator Login'
'Virtual Machine Contributor'
'Virtual Machine Local User Login'
'Virtual Machine User Login'
'VM Scanner Operator'
'Web Plan Contributor'
'Web PubSub Service Owner (Preview)'
'Web PubSub Service Reader (Preview)'
'Website Contributor'
'Windows Admin Center Administrator Login'
'Workbook Contributor'
'Workbook Reader'
'WorkloadBuilder Migration Agent Role'

])
param parRoleName string

@description('object id of the user who needs the role access')
param parPrincipalId string

@description('Defines which type needs to have access ex. User, Group or Serviceprincipal')
@allowed([
  'Device'
  'ForeignGroup'
  'Group'
  'ServicePrincipal'
  'User'
])
param parPrincipalType string

// variables
var varRoleIds = {
'Access Review Operator Service Role': resourceId('Microsoft.Authorization/roleAssignments', '76cc9ee4-d5d3-4a45-a930-26add3d73475')
'AcrDelete': resourceId('Microsoft.Authorization/roleAssignments', 'c2f4ef07-c644-48eb-af81-4b1b4947fb11')
'AcrImageSigner': resourceId('Microsoft.Authorization/roleAssignments', '6cef56e8-d556-48e5-a04f-b8e64114680f')
'AcrPull': resourceId('Microsoft.Authorization/roleAssignments', '7f951dda-4ed3-4680-a7ca-43fe172d538d')
'AcrPush': resourceId('Microsoft.Authorization/roleAssignments', '8311e382-0749-4cb8-b61a-304f252e45ec')
'AcrQuarantineReader': resourceId('Microsoft.Authorization/roleAssignments', 'cdda3590-29a3-44f6-95f2-9f980659eb04')
'AcrQuarantineWriter': resourceId('Microsoft.Authorization/roleAssignments', 'c8d4ff99-41c3-41a8-9f60-21dfdad59608')
'AgFood Platform Sensor Partner Contributor': resourceId('Microsoft.Authorization/roleAssignments', '6b77f0a0-0d89-41cc-acd1-579c22c17a67')
'AgFood Platform Service Admin': resourceId('Microsoft.Authorization/roleAssignments', 'f8da80de-1ff9-4747-ad80-a19b7f6079e3')
'AgFood Platform Service Contributor': resourceId('Microsoft.Authorization/roleAssignments', '8508508a-4469-4e45-963b-2518ee0bb728')
'AgFood Platform Service Reader': resourceId('Microsoft.Authorization/roleAssignments', '7ec7ccdc-f61e-41fe-9aaf-980df0a44eba')
'AnyBuild Builder': resourceId('Microsoft.Authorization/roleAssignments', 'a2138dac-4907-4679-a376-736901ed8ad8')
'API Management Developer Portal Content Editor': resourceId('Microsoft.Authorization/roleAssignments', 'c031e6a8-4391-4de0-8d69-4706a7ed3729')
'API Management Service Contributor': resourceId('Microsoft.Authorization/roleAssignments', '312a565d-c81f-4fd8-895a-4e21e48d571c')
'API Management Service Operator Role': resourceId('Microsoft.Authorization/roleAssignments', 'e022efe7-f5ba-4159-bbe4-b44f577e9b61')
'API Management Service Reader Role': resourceId('Microsoft.Authorization/roleAssignments', '71522526-b88f-4d52-b57f-d31fc3546d0d')
'App Configuration Data Owner': resourceId('Microsoft.Authorization/roleAssignments', '5ae67dd6-50cb-40e7-96ff-dc2bfa4b606b')
'App Configuration Data Reader': resourceId('Microsoft.Authorization/roleAssignments', '516239f1-63e1-4d78-a4de-a74fb236a071')
'Application Group Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'ca6382a4-1721-4bcf-a114-ff0c70227b6b')
'Application Insights Component Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'ae349356-3a1b-4a5e-921d-050484c6347e')
'Application Insights Snapshot Debugger': resourceId('Microsoft.Authorization/roleAssignments', '08954f03-6346-4c2e-81c0-ec3a5cfae23b')
'Attestation Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'bbf86eb8-f7b4-4cce-96e4-18cddf81d86e')
'Attestation Reader': resourceId('Microsoft.Authorization/roleAssignments', 'fd1bd22b-8476-40bc-a0bc-69b95687b9f3')
'Automation Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'f353d9bd-d4a6-484e-a77a-8050b599b867')
'Automation Job Operator': resourceId('Microsoft.Authorization/roleAssignments', '4fe576fe-1146-4730-92eb-48519fa6bf9f')
'Automation Operator': resourceId('Microsoft.Authorization/roleAssignments', 'd3881f73-407a-4167-8283-e981cbba0404')
'Automation Runbook Operator': resourceId('Microsoft.Authorization/roleAssignments', '5fb5aef8-1081-4b8e-bb16-9d5d0385bab5')
'Autonomous Development Platform Data Contributor (Preview)': resourceId('Microsoft.Authorization/roleAssignments', 'b8b15564-4fa6-4a59-ab12-03e1d9594795')
'Autonomous Development Platform Data Owner (Preview)': resourceId('Microsoft.Authorization/roleAssignments', '27f8b550-c507-4db9-86f2-f4b8e816d59d')
'Autonomous Development Platform Data Reader (Preview)': resourceId('Microsoft.Authorization/roleAssignments', 'd63b75f7-47ea-4f27-92ac-e0d173aaf093')
'Avere Contributor': resourceId('Microsoft.Authorization/roleAssignments', '4f8fab4f-1852-4a58-a46a-8eaf358af14a')
'Avere Operator': resourceId('Microsoft.Authorization/roleAssignments', 'c025889f-8102-4ebf-b32c-fc0c6f0c6bd9')
'Azure Arc Enabled Kubernetes Cluster User Role': resourceId('Microsoft.Authorization/roleAssignments', '00493d72-78f6-4148-b6c5-d3ce8e4799dd')
'Azure Arc Kubernetes Admin': resourceId('Microsoft.Authorization/roleAssignments', 'dffb1e0c-446f-4dde-a09f-99eb5cc68b96')
'Azure Arc Kubernetes Cluster Admin': resourceId('Microsoft.Authorization/roleAssignments', '8393591c-06b9-48a2-a542-1bd6b377f6a2')
'Azure Arc Kubernetes Viewer': resourceId('Microsoft.Authorization/roleAssignments', '63f0a09d-1495-4db4-a681-037d84835eb4')
'Azure Arc Kubernetes Writer': resourceId('Microsoft.Authorization/roleAssignments', '5b999177-9696-4545-85c7-50de3797e5a1')
'Azure Arc ScVmm Administrator role': resourceId('Microsoft.Authorization/roleAssignments', 'a92dfd61-77f9-4aec-a531-19858b406c87')
'Azure Arc ScVmm Private Cloud User': resourceId('Microsoft.Authorization/roleAssignments', 'c0781e91-8102-4553-8951-97c6d4243cda')
'Azure Arc ScVmm Private Clouds Onboarding': resourceId('Microsoft.Authorization/roleAssignments', '6aac74c4-6311-40d2-bbdd-7d01e7c6e3a9')
'Azure Arc ScVmm VM Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'e582369a-e17b-42a5-b10c-874c387c530b')
'Azure Arc VMware Administrator role ': resourceId('Microsoft.Authorization/roleAssignments', 'ddc140ed-e463-4246-9145-7c664192013f')
'Azure Arc VMware Private Cloud User': resourceId('Microsoft.Authorization/roleAssignments', 'ce551c02-7c42-47e0-9deb-e3b6fc3a9a83')
'Azure Arc VMware Private Clouds Onboarding': resourceId('Microsoft.Authorization/roleAssignments', '67d33e57-3129-45e6-bb0b-7cc522f762fa')
'Azure Arc VMware VM Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'b748a06d-6150-4f8a-aaa9-ce3940cd96cb')
'Azure Center for SAP solutions administrator': resourceId('Microsoft.Authorization/roleAssignments', '7b0c7e81-271f-4c71-90bf-e30bdfdbc2f7')
'Azure Center for SAP solutions reader': resourceId('Microsoft.Authorization/roleAssignments', '05352d14-a920-4328-a0de-4cbe7430e26b')
'Azure Center for SAP solutions service role': resourceId('Microsoft.Authorization/roleAssignments', 'aabbc5dd-1af0-458b-a942-81af88f9c138')
'Azure Connected Machine Onboarding': resourceId('Microsoft.Authorization/roleAssignments', 'b64e21ea-ac4e-4cdf-9dc9-5b892992bee7')
'Azure Connected Machine Resource Administrator': resourceId('Microsoft.Authorization/roleAssignments', 'cd570a14-e51a-42ad-bac8-bafd67325302')
'Azure Connected Machine Resource Manager': resourceId('Microsoft.Authorization/roleAssignments', 'f5819b54-e033-4d82-ac66-4fec3cbf3f4c')
'Azure Connected SQL Server Onboarding': resourceId('Microsoft.Authorization/roleAssignments', 'e8113dce-c529-4d33-91fa-e9b972617508')
'Azure Digital Twins Data Owner': resourceId('Microsoft.Authorization/roleAssignments', 'bcd981a7-7f74-457b-83e1-cceb9e632ffe')
'Azure Digital Twins Data Reader': resourceId('Microsoft.Authorization/roleAssignments', 'd57506d4-4c8d-48b1-8587-93c323f6a5a3')
'Azure Event Hubs Data Owner': resourceId('Microsoft.Authorization/roleAssignments', 'f526a384-b230-433a-b45c-95f59c4a2dec')
'Azure Event Hubs Data Receiver': resourceId('Microsoft.Authorization/roleAssignments', 'a638d3c7-ab3a-418d-83e6-5f17a39d4fde')
'Azure Event Hubs Data Sender': resourceId('Microsoft.Authorization/roleAssignments', '2b629674-e913-4c01-ae53-ef4638d8f975')
'Azure Kubernetes Fleet Manager Contributor Role': resourceId('Microsoft.Authorization/roleAssignments', '63bb64ad-9799-4770-b5c3-24ed299a07bf')
'Azure Kubernetes Fleet Manager RBAC Admin': resourceId('Microsoft.Authorization/roleAssignments', '434fb43a-c01c-447e-9f67-c3ad923cfaba')
'Azure Kubernetes Fleet Manager RBAC Cluster Admin': resourceId('Microsoft.Authorization/roleAssignments', '18ab4d3d-a1bf-4477-8ad9-8359bc988f69')
'Azure Kubernetes Fleet Manager RBAC Reader': resourceId('Microsoft.Authorization/roleAssignments', '30b27cfc-9c84-438e-b0ce-70e35255df80')
'Azure Kubernetes Fleet Manager RBAC Writer': resourceId('Microsoft.Authorization/roleAssignments', '5af6afb3-c06c-4fa4-8848-71a8aee05683')
'Azure Kubernetes Service Cluster Admin Role': resourceId('Microsoft.Authorization/roleAssignments', '0ab0b1a8-8aac-4efd-b8c2-3ee1fb270be8')
'Azure Kubernetes Service Cluster Monitoring User': resourceId('Microsoft.Authorization/roleAssignments', '1afdec4b-e479-420e-99e7-f82237c7c5e6')
'Azure Kubernetes Service Cluster User Role': resourceId('Microsoft.Authorization/roleAssignments', '4abbcc35-e782-43d8-92c5-2d3f1bd2253f')
'Azure Kubernetes Service Contributor Role': resourceId('Microsoft.Authorization/roleAssignments', 'ed7f3fbd-7b88-4dd4-9017-9adb7ce333f8')
'Azure Kubernetes Service Policy Add-on Deployment': resourceId('Microsoft.Authorization/roleAssignments', '18ed5180-3e48-46fd-8541-4ea054d57064')
'Azure Kubernetes Service RBAC Admin': resourceId('Microsoft.Authorization/roleAssignments', '3498e952-d568-435e-9b2c-8d77e338d7f7')
'Azure Kubernetes Service RBAC Cluster Admin': resourceId('Microsoft.Authorization/roleAssignments', 'b1ff04bb-8a4e-4dc4-8eb5-8693973ce19b')
'Azure Kubernetes Service RBAC Reader': resourceId('Microsoft.Authorization/roleAssignments', '7f6c6a51-bcf8-42ba-9220-52d62157d7db')
'Azure Kubernetes Service RBAC Writer': resourceId('Microsoft.Authorization/roleAssignments', 'a7ffa36f-339b-4b5c-8bdf-e2c188b2c0eb')
'Azure Maps Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'dba33070-676a-4fb0-87fa-064dc56ff7fb')
'Azure Maps Data Contributor': resourceId('Microsoft.Authorization/roleAssignments', '8f5e0ce6-4f7b-4dcf-bddf-e6f48634a204')
'Azure Maps Data Reader': resourceId('Microsoft.Authorization/roleAssignments', '423170ca-a8f6-4b0f-8487-9e4eb8f49bfa')
'Azure Maps Search and Render Data Reader': resourceId('Microsoft.Authorization/roleAssignments', '6be48352-4f82-47c9-ad5e-0acacefdb005')
'Azure Relay Listener': resourceId('Microsoft.Authorization/roleAssignments', '26e0b698-aa6d-4085-9386-aadae190014d')
'Azure Relay Owner': resourceId('Microsoft.Authorization/roleAssignments', '2787bf04-f1f5-4bfe-8383-c8a24483ee38')
'Azure Relay Sender': resourceId('Microsoft.Authorization/roleAssignments', '26baccc8-eea7-41f1-98f4-1762cc7f685d')
'Azure Service Bus Data Owner': resourceId('Microsoft.Authorization/roleAssignments', '090c5cfd-751d-490a-894a-3ce6f1109419')
'Azure Service Bus Data Receiver': resourceId('Microsoft.Authorization/roleAssignments', '4f6d3b9b-027b-4f4c-9142-0e5a2a2247e0')
'Azure Service Bus Data Sender': resourceId('Microsoft.Authorization/roleAssignments', '69a216fc-b8fb-44d8-bc22-1f3c2cd27a39')
'Azure Spring Apps Connect Role': resourceId('Microsoft.Authorization/roleAssignments', '80558df3-64f9-4c0f-b32d-e5094b036b0b')
'Azure Spring Apps Remote Debugging Role': resourceId('Microsoft.Authorization/roleAssignments', 'a99b0159-1064-4c22-a57b-c9b3caa1c054')
'Azure Spring Cloud Config Server Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'a06f5c24-21a7-4e1a-aa2b-f19eb6684f5b')
'Azure Spring Cloud Config Server Reader': resourceId('Microsoft.Authorization/roleAssignments', 'd04c6db6-4947-4782-9e91-30a88feb7be7')
'Azure Spring Cloud Data Reader': resourceId('Microsoft.Authorization/roleAssignments', 'b5537268-8956-4941-a8f0-646150406f0c')
'Azure Spring Cloud Service Registry Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'f5880b48-c26d-48be-b172-7927bfa1c8f1')
'Azure Spring Cloud Service Registry Reader': resourceId('Microsoft.Authorization/roleAssignments', 'cff1b556-2399-4e7e-856d-a8f754be7b65')
'Azure Stack Registration Owner': resourceId('Microsoft.Authorization/roleAssignments', '6f12a6df-dd06-4f3e-bcb1-ce8be600526a')
'Azure Traffic Controller Configuration Manager': resourceId('Microsoft.Authorization/roleAssignments', 'fbc52c3f-28ad-4303-a892-8a056630b8f1')
'Azure VM Managed identities restore Contributor': resourceId('Microsoft.Authorization/roleAssignments', '6ae96244-5829-4925-a7d3-5975537d91dd')
'AzureML Compute Operator': resourceId('Microsoft.Authorization/roleAssignments', 'e503ece1-11d0-4e8e-8e2c-7a6c3bf38815')
'AzureML Data Scientist': resourceId('Microsoft.Authorization/roleAssignments', 'f6c7c914-8db3-469d-8ca1-694a8f32e121')
'AzureML Metrics Writer (preview)': resourceId('Microsoft.Authorization/roleAssignments', '635dd51f-9968-44d3-b7fb-6d9a6bd613ae')
'AzureML Registry User': resourceId('Microsoft.Authorization/roleAssignments', '1823dd4f-9b8c-4ab6-ab4e-7397a3684615')
'Backup Contributor': resourceId('Microsoft.Authorization/roleAssignments', '5e467623-bb1f-42f4-a55d-6e525e11384b')
'Backup Operator': resourceId('Microsoft.Authorization/roleAssignments', '00c29273-979b-4161-815c-10b084fb9324')
'Backup Reader': resourceId('Microsoft.Authorization/roleAssignments', 'a795c7a0-d4a2-40c1-ae25-d81f01202912')
'Billing Reader': resourceId('Microsoft.Authorization/roleAssignments', 'fa23ad8b-c56e-40d8-ac0c-ce449e1d2c64')
'BizTalk Contributor': resourceId('Microsoft.Authorization/roleAssignments', '5e3c6656-6cfa-4708-81fe-0de47ac73342')
'Blockchain Member Node Access (Preview)': resourceId('Microsoft.Authorization/roleAssignments', '31a002a1-acaf-453e-8a5b-297c9ca1ea24')
'Blueprint Contributor': resourceId('Microsoft.Authorization/roleAssignments', '41077137-e803-4205-871c-5a86e6a753b4')
'Blueprint Operator': resourceId('Microsoft.Authorization/roleAssignments', '437d2ced-4a38-4302-8479-ed2bcb43d090')
'CDN Endpoint Contributor': resourceId('Microsoft.Authorization/roleAssignments', '426e0c7f-0c7e-4658-b36f-ff54d6c29b45')
'CDN Endpoint Reader': resourceId('Microsoft.Authorization/roleAssignments', '871e35f6-b5c1-49cc-a043-bde969a0f2cd')
'CDN Profile Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'ec156ff8-a8d1-4d15-830c-5b80698ca432')
'CDN Profile Reader': resourceId('Microsoft.Authorization/roleAssignments', '8f96442b-4075-438f-813d-ad51ab4019af')
'Chamber Admin': resourceId('Microsoft.Authorization/roleAssignments', '4e9b8407-af2e-495b-ae54-bb60a55b1b5a')
'Chamber User': resourceId('Microsoft.Authorization/roleAssignments', '4447db05-44ed-4da3-ae60-6cbece780e32')
'Classic Network Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'b34d265f-36f7-4a0d-a4d4-e158ca92e90f')
'Classic Storage Account Contributor': resourceId('Microsoft.Authorization/roleAssignments', '86e8f5dc-a6e9-4c67-9d15-de283e8eac25')
'Classic Storage Account Key Operator Service Role': resourceId('Microsoft.Authorization/roleAssignments', '985d6b00-f706-48f5-a6fe-d0ca12fb668d')
'Classic Virtual Machine Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'd73bb868-a0df-4d4d-bd69-98a00b01fccb')
'ClearDB MySQL DB Contributor': resourceId('Microsoft.Authorization/roleAssignments', '9106cda0-8a86-4e81-b686-29a22c54effe')
'Code Signing Certificate Profile Signer': resourceId('Microsoft.Authorization/roleAssignments', '2837e146-70d7-4cfd-ad55-7efa6464f958')
'Code Signing Identity Verifier': resourceId('Microsoft.Authorization/roleAssignments', '4339b7cf-9826-4e41-b4ed-c7f4505dac08')
'Cognitive Services Contributor': resourceId('Microsoft.Authorization/roleAssignments', '25fbc0a9-bd7c-42a3-aa1a-3b75d497ee68')
'Cognitive Services Custom Vision Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'c1ff6cc2-c111-46fe-8896-e0ef812ad9f3')
'Cognitive Services Custom Vision Deployment': resourceId('Microsoft.Authorization/roleAssignments', '5c4089e1-6d96-4d2f-b296-c1bc7137275f')
'Cognitive Services Custom Vision Labeler': resourceId('Microsoft.Authorization/roleAssignments', '88424f51-ebe7-446f-bc41-7fa16989e96c')
'Cognitive Services Custom Vision Reader': resourceId('Microsoft.Authorization/roleAssignments', '93586559-c37d-4a6b-ba08-b9f0940c2d73')
'Cognitive Services Custom Vision Trainer': resourceId('Microsoft.Authorization/roleAssignments', '0a5ae4ab-0d65-4eeb-be61-29fc9b54394b')
'Cognitive Services Data Reader (Preview)': resourceId('Microsoft.Authorization/roleAssignments', 'b59867f0-fa02-499b-be73-45a86b5b3e1c')
'Cognitive Services Face Recognizer': resourceId('Microsoft.Authorization/roleAssignments', '9894cab4-e18a-44aa-828b-cb588cd6f2d7')
'Cognitive Services Immersive Reader User': resourceId('Microsoft.Authorization/roleAssignments', 'b2de6794-95db-4659-8781-7e080d3f2b9d')
'Cognitive Services Language Owner': resourceId('Microsoft.Authorization/roleAssignments', 'f07febfe-79bc-46b1-8b37-790e26e6e498')
'Cognitive Services Language Reader': resourceId('Microsoft.Authorization/roleAssignments', '7628b7b8-a8b2-4cdc-b46f-e9b35248918e')
'Cognitive Services Language Writer': resourceId('Microsoft.Authorization/roleAssignments', 'f2310ca1-dc64-4889-bb49-c8e0fa3d47a8')
'Cognitive Services LUIS Owner': resourceId('Microsoft.Authorization/roleAssignments', 'f72c8140-2111-481c-87ff-72b910f6e3f8')
'Cognitive Services LUIS Reader': resourceId('Microsoft.Authorization/roleAssignments', '18e81cdc-4e98-4e29-a639-e7d10c5a6226')
'Cognitive Services LUIS Writer': resourceId('Microsoft.Authorization/roleAssignments', '6322a993-d5c9-4bed-b113-e49bbea25b27')
'Cognitive Services Metrics Advisor Administrator': resourceId('Microsoft.Authorization/roleAssignments', 'cb43c632-a144-4ec5-977c-e80c4affc34a')
'Cognitive Services Metrics Advisor User': resourceId('Microsoft.Authorization/roleAssignments', '3b20f47b-3825-43cb-8114-4bd2201156a8')
'Cognitive Services OpenAI Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'a001fd3d-188f-4b5d-821b-7da978bf7442')
'Cognitive Services OpenAI User': resourceId('Microsoft.Authorization/roleAssignments', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
'Cognitive Services QnA Maker Editor': resourceId('Microsoft.Authorization/roleAssignments', 'f4cc2bf9-21be-47a1-bdf1-5c5804381025')
'Cognitive Services QnA Maker Reader': resourceId('Microsoft.Authorization/roleAssignments', '466ccd10-b268-4a11-b098-b4849f024126')
'Cognitive Services Speech Contributor': resourceId('Microsoft.Authorization/roleAssignments', '0e75ca1e-0464-4b4d-8b93-68208a576181')
'Cognitive Services Speech User': resourceId('Microsoft.Authorization/roleAssignments', 'f2dc8367-1007-4938-bd23-fe263f013447')
'Cognitive Services User': resourceId('Microsoft.Authorization/roleAssignments', 'a97b65f3-24c7-4388-baec-2e87135dc908')
'Collaborative Data Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'daa9e50b-21df-454c-94a6-a8050adab352')
'Collaborative Runtime Operator': resourceId('Microsoft.Authorization/roleAssignments', '7a6f0e70-c033-4fb1-828c-08514e5f4102')
'Compute Gallery Sharing Admin': resourceId('Microsoft.Authorization/roleAssignments', '1ef6a3be-d0ac-425d-8c01-acb62866290b')
'Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'b24988ac-6180-42a0-ab88-20f7382dd24c')
'Contributor with resource lock rights': resourceId('Microsoft.Authorization/roleAssignments', '484cc2a0-82f0-4fce-bbd1-7970904069e8')
'Cosmos DB Account Reader Role': resourceId('Microsoft.Authorization/roleAssignments', 'fbdf93bf-df7d-467e-a4d2-9458aa1360c8')
'Cosmos DB Operator': resourceId('Microsoft.Authorization/roleAssignments', '230815da-be43-4aae-9cb4-875f7bd000aa')
'CosmosBackupOperator': resourceId('Microsoft.Authorization/roleAssignments', 'db7b14f2-5adf-42da-9f96-f2ee17bab5cb')
'CosmosRestoreOperator': resourceId('Microsoft.Authorization/roleAssignments', '5432c526-bc82-444a-b7ba-57c5b0b5b34f')
'Cost Management Contributor': resourceId('Microsoft.Authorization/roleAssignments', '434105ed-43f6-45c7-a02f-909b2ba83430')
'Cost Management Reader': resourceId('Microsoft.Authorization/roleAssignments', '72fafb9e-0641-4937-9268-a91bfd8191a3')
'Data Box Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'add466c9-e687-43fc-8d98-dfcf8d720be5')
'Data Box Reader': resourceId('Microsoft.Authorization/roleAssignments', '028f4ed7-e2a9-465e-a8f4-9c0ffdfdc027')
'Data Factory Contributor': resourceId('Microsoft.Authorization/roleAssignments', '673868aa-7521-48a0-acc6-0f60742d39f5')
'Data Labeling - Labeler': resourceId('Microsoft.Authorization/roleAssignments', 'c6decf44-fd0a-444c-a844-d653c394e7ab')
'Data Lake Analytics Developer': resourceId('Microsoft.Authorization/roleAssignments', '47b7735b-770e-4598-a7da-8b91488b4c88')
'Data Operator for Managed Disks': resourceId('Microsoft.Authorization/roleAssignments', '959f8984-c045-4866-89c7-12bf9737be2e')
'Data Purger': resourceId('Microsoft.Authorization/roleAssignments', '150f5e0c-0603-4f03-8c7f-cf70034c4e90')
'Deployment Environments User': resourceId('Microsoft.Authorization/roleAssignments', '18e40d4e-8d2e-438d-97e1-9528336e149c')
'Desktop Virtualization Application Group Contributor': resourceId('Microsoft.Authorization/roleAssignments', '86240b0e-9422-4c43-887b-b61143f32ba8')
'Desktop Virtualization Application Group Reader': resourceId('Microsoft.Authorization/roleAssignments', 'aebf23d0-b568-4e86-b8f9-fe83a2c6ab55')
'Desktop Virtualization Contributor': resourceId('Microsoft.Authorization/roleAssignments', '082f0a83-3be5-4ba1-904c-961cca79b387')
'Desktop Virtualization Host Pool Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'e307426c-f9b6-4e81-87de-d99efb3c32bc')
'Desktop Virtualization Host Pool Reader': resourceId('Microsoft.Authorization/roleAssignments', 'ceadfde2-b300-400a-ab7b-6143895aa822')
'Desktop Virtualization Power On Contributor': resourceId('Microsoft.Authorization/roleAssignments', '489581de-a3bd-480d-9518-53dea7416b33')
'Desktop Virtualization Power On Off Contributor': resourceId('Microsoft.Authorization/roleAssignments', '40c5ff49-9181-41f8-ae61-143b0e78555e')
'Desktop Virtualization Reader': resourceId('Microsoft.Authorization/roleAssignments', '49a72310-ab8d-41df-bbb0-79b649203868')
'Desktop Virtualization Session Host Operator': resourceId('Microsoft.Authorization/roleAssignments', '2ad6aaab-ead9-4eaa-8ac5-da422f562408')
'Desktop Virtualization User': resourceId('Microsoft.Authorization/roleAssignments', '1d18fff3-a72a-46b5-b4a9-0b38a3cd7e63')
'Desktop Virtualization User Session Operator': resourceId('Microsoft.Authorization/roleAssignments', 'ea4bfff8-7fb4-485a-aadd-d4129a0ffaa6')
'Desktop Virtualization Virtual Machine Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'a959dbd1-f747-45e3-8ba6-dd80f235f97c')
'Desktop Virtualization Workspace Contributor': resourceId('Microsoft.Authorization/roleAssignments', '21efdde3-836f-432b-bf3d-3e8e734d4b2b')
'Desktop Virtualization Workspace Reader': resourceId('Microsoft.Authorization/roleAssignments', '0fa44ee9-7a7d-466b-9bb2-2bf446b1204d')
'DevCenter Dev Box User': resourceId('Microsoft.Authorization/roleAssignments', '45d50f46-0b78-4001-a660-4198cbe8cd05')
'DevCenter Project Admin': resourceId('Microsoft.Authorization/roleAssignments', '331c37c6-af14-46d9-b9f4-e1909e1b95a0')
'Device Provisioning Service Data Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'dfce44e4-17b7-4bd1-a6d1-04996ec95633')
'Device Provisioning Service Data Reader': resourceId('Microsoft.Authorization/roleAssignments', '10745317-c249-44a1-a5ce-3a4353c0bbd8')
'Device Update Administrator': resourceId('Microsoft.Authorization/roleAssignments', '02ca0879-e8e4-47a5-a61e-5c618b76e64a')
'Device Update Content Administrator': resourceId('Microsoft.Authorization/roleAssignments', '0378884a-3af5-44ab-8323-f5b22f9f3c98')
'Device Update Content Reader': resourceId('Microsoft.Authorization/roleAssignments', 'd1ee9a80-8b14-47f0-bdc2-f4a351625a7b')
'Device Update Deployments Administrator': resourceId('Microsoft.Authorization/roleAssignments', 'e4237640-0e3d-4a46-8fda-70bc94856432')
'Device Update Deployments Reader': resourceId('Microsoft.Authorization/roleAssignments', '49e2f5d2-7741-4835-8efa-19e1fe35e47f')
'Device Update Reader': resourceId('Microsoft.Authorization/roleAssignments', 'e9dba6fb-3d52-4cf0-bce3-f06ce71b9e0f')
'DevTest Labs User': resourceId('Microsoft.Authorization/roleAssignments', '76283e04-6283-4c54-8f91-bcf1374a3c64')
'DICOM Data Owner': resourceId('Microsoft.Authorization/roleAssignments', '58a3b984-7adf-4c20-983a-32417c86fbc8')
'DICOM Data Reader': resourceId('Microsoft.Authorization/roleAssignments', 'e89c7a3c-2f64-4fa1-a847-3e4c9ba4283a')
'Disk Backup Reader': resourceId('Microsoft.Authorization/roleAssignments', '3e5e47e6-65f7-47ef-90b5-e5dd4d455f24')
'Disk Pool Operator': resourceId('Microsoft.Authorization/roleAssignments', '60fc6e62-5479-42d4-8bf4-67625fcc2840')
'Disk Restore Operator': resourceId('Microsoft.Authorization/roleAssignments', 'b50d9833-a0cb-478e-945f-707fcc997c13')
'Disk Snapshot Contributor': resourceId('Microsoft.Authorization/roleAssignments', '7efff54f-a5b4-42b5-a1c5-5411624893ce')
'DNS Resolver Contributor': resourceId('Microsoft.Authorization/roleAssignments', '0f2ebee7-ffd4-4fc0-b3b7-664099fdad5d')
'DNS Zone Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'befefa01-2a29-4197-83a8-272ff33ce314')
'DocumentDB Account Contributor': resourceId('Microsoft.Authorization/roleAssignments', '5bd9cd88-fe45-4216-938b-f97437e15450')
'Domain Services Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'eeaeda52-9324-47f6-8069-5d5bade478b2')
'Domain Services Reader': resourceId('Microsoft.Authorization/roleAssignments', '361898ef-9ed1-48c2-849c-a832951106bb')
'Elastic SAN Owner': resourceId('Microsoft.Authorization/roleAssignments', '80dcbedb-47ef-405d-95bd-188a1b4ac406')
'Elastic SAN Reader': resourceId('Microsoft.Authorization/roleAssignments', 'af6a70f8-3c9f-4105-acf1-d719e9fca4ca')
'Elastic SAN Volume Group Owner': resourceId('Microsoft.Authorization/roleAssignments', 'a8281131-f312-4f34-8d98-ae12be9f0d23')
'EventGrid Contributor': resourceId('Microsoft.Authorization/roleAssignments', '1e241071-0855-49ea-94dc-649edcd759de')
'EventGrid Data Sender': resourceId('Microsoft.Authorization/roleAssignments', 'd5a91429-5739-47e2-a06b-3470a27159e7')
'EventGrid EventSubscription Contributor': resourceId('Microsoft.Authorization/roleAssignments', '428e0ff0-5e57-4d9c-a221-2c70d0e0a443')
'EventGrid EventSubscription Reader': resourceId('Microsoft.Authorization/roleAssignments', '2414bbcf-6497-4faf-8c65-045460748405')
'Experimentation Administrator': resourceId('Microsoft.Authorization/roleAssignments', '7f646f1b-fa08-80eb-a33b-edd6ce5c915c')
'Experimentation Contributor': resourceId('Microsoft.Authorization/roleAssignments', '7f646f1b-fa08-80eb-a22b-edd6ce5c915c')
'Experimentation Metric Contributor': resourceId('Microsoft.Authorization/roleAssignments', '6188b7c9-7d01-4f99-a59f-c88b630326c0')
'Experimentation Reader': resourceId('Microsoft.Authorization/roleAssignments', '49632ef5-d9ac-41f4-b8e7-bbe587fa74a1')
'FHIR Data Contributor': resourceId('Microsoft.Authorization/roleAssignments', '5a1fc7df-4bf1-4951-a576-89034ee01acd')
'FHIR Data Converter': resourceId('Microsoft.Authorization/roleAssignments', 'a1705bd2-3a8f-45a5-8683-466fcfd5cc24')
'FHIR Data Exporter': resourceId('Microsoft.Authorization/roleAssignments', '3db33094-8700-4567-8da5-1501d4e7e843')
'FHIR Data Importer': resourceId('Microsoft.Authorization/roleAssignments', '4465e953-8ced-4406-a58e-0f6e3f3b530b')
'FHIR Data Reader': resourceId('Microsoft.Authorization/roleAssignments', '4c8d0bbc-75d3-4935-991f-5f3c56d81508')
'FHIR Data Writer': resourceId('Microsoft.Authorization/roleAssignments', '3f88fce4-5892-4214-ae73-ba5294559913')
'FHIR SMART User': resourceId('Microsoft.Authorization/roleAssignments', '4ba50f17-9666-485c-a643-ff00808643f0')
'Grafana Admin': resourceId('Microsoft.Authorization/roleAssignments', '22926164-76b3-42b3-bc55-97df8dab3e41')
'Grafana Editor': resourceId('Microsoft.Authorization/roleAssignments', 'a79a5197-3a5c-4973-a920-486035ffd60f')
'Grafana Viewer': resourceId('Microsoft.Authorization/roleAssignments', '60921a7e-fef1-4a43-9b16-a26c52ad4769')
'Graph Owner': resourceId('Microsoft.Authorization/roleAssignments', 'b60367af-1334-4454-b71e-769d9a4f83d9')
'Guest Configuration Resource Contributor': resourceId('Microsoft.Authorization/roleAssignments', '088ab73d-1256-47ae-bea9-9de8e7131f31')
'HDInsight Cluster Operator': resourceId('Microsoft.Authorization/roleAssignments', '61ed4efc-fab3-44fd-b111-e24485cc132a')
'HDInsight Domain Services Contributor': resourceId('Microsoft.Authorization/roleAssignments', '8d8d5a11-05d3-4bda-a417-a08778121c7c')
'Hierarchy Settings Administrator': resourceId('Microsoft.Authorization/roleAssignments', '350f8d15-c687-4448-8ae1-157740a3936d')
'Hybrid Server Onboarding': resourceId('Microsoft.Authorization/roleAssignments', '5d1e5ee4-7c68-4a71-ac8b-0739630a3dfb')
'Hybrid Server Resource Administrator': resourceId('Microsoft.Authorization/roleAssignments', '48b40c6e-82e0-4eb3-90d5-19e40f49b624')
'Impact Reader': resourceId('Microsoft.Authorization/roleAssignments', '68ff5d27-c7f5-4fa9-a21c-785d0df7bd9e')
'Impact Reporter': resourceId('Microsoft.Authorization/roleAssignments', '36e80216-a7e8-4f42-a7e1-f12c98cbaf8a')
'Integration Service Environment Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'a41e2c5b-bd99-4a07-88f4-9bf657a760b8')
'Integration Service Environment Developer': resourceId('Microsoft.Authorization/roleAssignments', 'c7aa55d3-1abb-444a-a5ca-5e51e485d6ec')
'Intelligent Systems Account Contributor': resourceId('Microsoft.Authorization/roleAssignments', '03a6d094-3444-4b3d-88af-7477090a9e5e')
'IoT Hub Data Contributor': resourceId('Microsoft.Authorization/roleAssignments', '4fc6c259-987e-4a07-842e-c321cc9d413f')
'IoT Hub Data Reader': resourceId('Microsoft.Authorization/roleAssignments', 'b447c946-2db7-41ec-983d-d8bf3b1c77e3')
'IoT Hub Registry Contributor': resourceId('Microsoft.Authorization/roleAssignments', '4ea46cd5-c1b2-4a8e-910b-273211f9ce47')
'IoT Hub Twin Contributor': resourceId('Microsoft.Authorization/roleAssignments', '494bdba2-168f-4f31-a0a1-191d2f7c028c')
'Key Vault Administrator': resourceId('Microsoft.Authorization/roleAssignments', '00482a5a-887f-4fb3-b363-3b7fe8e74483')
'Key Vault Certificates Officer': resourceId('Microsoft.Authorization/roleAssignments', 'a4417e6f-fecd-4de8-b567-7b0420556985')
'Key Vault Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'f25e0fa2-a7c8-4377-a976-54943a77a395')
'Key Vault Crypto Officer': resourceId('Microsoft.Authorization/roleAssignments', '14b46e9e-c2b7-41b4-b07b-48a6ebf60603')
'Key Vault Crypto Service Encryption User': resourceId('Microsoft.Authorization/roleAssignments', 'e147488a-f6f5-4113-8e2d-b22465e65bf6')
'Key Vault Crypto User': resourceId('Microsoft.Authorization/roleAssignments', '12338af0-0e69-4776-bea7-57ae8d297424')
'Key Vault Reader': resourceId('Microsoft.Authorization/roleAssignments', '21090545-7ca7-4776-b22c-e363652d74d2')
'Key Vault Secrets Officer': resourceId('Microsoft.Authorization/roleAssignments', 'b86a8fe4-44ce-4948-aee5-eccb2c155cd7')
'Key Vault Secrets User': resourceId('Microsoft.Authorization/roleAssignments', '4633458b-17de-408a-b874-0445c86b69e6')
'Knowledge Consumer': resourceId('Microsoft.Authorization/roleAssignments', 'ee361c5d-f7b5-4119-b4b6-892157c8f64c')
'Kubernetes Cluster - Azure Arc Onboarding': resourceId('Microsoft.Authorization/roleAssignments', '34e09817-6cbe-4d01-b1a2-e0eac5743d41')
'Kubernetes Extension Contributor': resourceId('Microsoft.Authorization/roleAssignments', '85cb6faf-e071-4c9b-8136-154b5a04f717')
'Kubernetes Namespace User': resourceId('Microsoft.Authorization/roleAssignments', 'ba79058c-0414-4a34-9e42-c3399d80cd5a')
'Lab Assistant': resourceId('Microsoft.Authorization/roleAssignments', 'ce40b423-cede-4313-a93f-9b28290b72e1')
'Lab Contributor': resourceId('Microsoft.Authorization/roleAssignments', '5daaa2af-1fe8-407c-9122-bba179798270')
'Lab Creator': resourceId('Microsoft.Authorization/roleAssignments', 'b97fb8bc-a8b2-4522-a38b-dd33c7e65ead')
'Lab Operator': resourceId('Microsoft.Authorization/roleAssignments', 'a36e6959-b6be-4b12-8e9f-ef4b474d304d')
'Lab Services Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'f69b8690-cc87-41d6-b77a-a4bc3c0a966f')
'Lab Services Reader': resourceId('Microsoft.Authorization/roleAssignments', '2a5c394f-5eb7-4d4f-9c8e-e8eae39faebc')
'Load Test Contributor': resourceId('Microsoft.Authorization/roleAssignments', '749a398d-560b-491b-bb21-08924219302e')
'Load Test Owner': resourceId('Microsoft.Authorization/roleAssignments', '45bb0b16-2f0c-4e78-afaa-a07599b003f6')
'Load Test Reader': resourceId('Microsoft.Authorization/roleAssignments', '3ae3fb29-0000-4ccd-bf80-542e7b26e081')
'Log Analytics Contributor': resourceId('Microsoft.Authorization/roleAssignments', '92aaf0da-9dab-42b6-94a3-d43ce8d16293')
'Log Analytics Reader': resourceId('Microsoft.Authorization/roleAssignments', '73c42c96-874c-492b-b04d-ab87d138a893')
'Logic App Contributor': resourceId('Microsoft.Authorization/roleAssignments', '87a39d53-fc1b-424a-814c-f7e04687dc9e')
'Logic App Operator': resourceId('Microsoft.Authorization/roleAssignments', '515c2055-d9d4-4321-b1b9-bd0c9a0f79fe')
'Managed Application Contributor Role': resourceId('Microsoft.Authorization/roleAssignments', '641177b8-a67a-45b9-a033-47bc880bb21e')
'Managed Application Operator Role': resourceId('Microsoft.Authorization/roleAssignments', 'c7393b34-138c-406f-901b-d8cf2b17e6ae')
'Managed Applications Reader': resourceId('Microsoft.Authorization/roleAssignments', 'b9331d33-8a36-4f8c-b097-4f54124fdb44')
'Managed HSM contributor': resourceId('Microsoft.Authorization/roleAssignments', '18500a29-7fe2-46b2-a342-b16a415e101d')
'Managed Identity Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'e40ec5ca-96e0-45a2-b4ff-59039f2c2b59')
'Managed Identity Operator': resourceId('Microsoft.Authorization/roleAssignments', 'f1a07417-d97a-45cb-824c-7a7467783830')
'Managed Services Registration assignment Delete Role': resourceId('Microsoft.Authorization/roleAssignments', '91c1777a-f3dc-4fae-b103-61d183457e46')
'Management Group Contributor': resourceId('Microsoft.Authorization/roleAssignments', '5d58bcaf-24a5-4b20-bdb6-eed9f69fbe4c')
'Management Group Reader': resourceId('Microsoft.Authorization/roleAssignments', 'ac63b705-f282-497d-ac71-919bf39d939d')
'Media Services Account Administrator': resourceId('Microsoft.Authorization/roleAssignments', '054126f8-9a2b-4f1c-a9ad-eca461f08466')
'Media Services Live Events Administrator': resourceId('Microsoft.Authorization/roleAssignments', '532bc159-b25e-42c0-969e-a1d439f60d77')
'Media Services Media Operator': resourceId('Microsoft.Authorization/roleAssignments', 'e4395492-1534-4db2-bedf-88c14621589c')
'Media Services Policy Administrator': resourceId('Microsoft.Authorization/roleAssignments', 'c4bba371-dacd-4a26-b320-7250bca963ae')
'Media Services Streaming Endpoints Administrator': resourceId('Microsoft.Authorization/roleAssignments', '99dba123-b5fe-44d5-874c-ced7199a5804')
'Microsoft Sentinel Automation Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'f4c81013-99ee-4d62-a7ee-b3f1f648599a')
'Microsoft Sentinel Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'ab8e14d6-4a74-4a29-9ba8-549422addade')
'Microsoft Sentinel Playbook Operator': resourceId('Microsoft.Authorization/roleAssignments', '51d6186e-6489-4900-b93f-92e23144cca5')
'Microsoft Sentinel Reader': resourceId('Microsoft.Authorization/roleAssignments', '8d289c81-5878-46d4-8554-54e1e3d8b5cb')
'Microsoft Sentinel Responder': resourceId('Microsoft.Authorization/roleAssignments', '3e150937-b8fe-4cfb-8069-0eaf05ecd056')
'Microsoft.Kubernetes connected cluster role': resourceId('Microsoft.Authorization/roleAssignments', '5548b2cf-c94c-4228-90ba-30851930a12f')
'Monitoring Contributor': resourceId('Microsoft.Authorization/roleAssignments', '749f88d5-cbae-40b8-bcfc-e573ddc772fa')
'Monitoring Data Reader': resourceId('Microsoft.Authorization/roleAssignments', 'b0d8363b-8ddd-447d-831f-62ca05bff136')
'Monitoring Metrics Publisher': resourceId('Microsoft.Authorization/roleAssignments', '3913510d-42f4-4e42-8a64-420c390055eb')
'Monitoring Reader': resourceId('Microsoft.Authorization/roleAssignments', '43d0d8ad-25c7-4714-9337-8ba259a9fe05')
'Network Contributor': resourceId('Microsoft.Authorization/roleAssignments', '4d97b98b-1d4f-4787-a291-c67834d212e7')
'New Relic APM Account Contributor': resourceId('Microsoft.Authorization/roleAssignments', '5d28c62d-5b37-4476-8438-e587778df237')
'Object Anchors Account Owner': resourceId('Microsoft.Authorization/roleAssignments', 'ca0835dd-bacc-42dd-8ed2-ed5e7230d15b')
'Object Anchors Account Reader': resourceId('Microsoft.Authorization/roleAssignments', '4a167cdf-cb95-4554-9203-2347fe489bd9')
'Object Understanding Account Owner': resourceId('Microsoft.Authorization/roleAssignments', '4dd61c23-6743-42fe-a388-d8bdd41cb745')
'Object Understanding Account Reader': resourceId('Microsoft.Authorization/roleAssignments', 'd18777c0-1514-4662-8490-608db7d334b6')
'Owner': resourceId('Microsoft.Authorization/roleAssignments', '8e3af657-a8ff-443c-a75c-2fe8c4bcb635')
'PlayFab Contributor': resourceId('Microsoft.Authorization/roleAssignments', '0c8b84dc-067c-4039-9615-fa1a4b77c726')
'PlayFab Reader': resourceId('Microsoft.Authorization/roleAssignments', 'a9a19cc5-31f4-447c-901f-56c0bb18fcaf')
'Policy Insights Data Writer (Preview)': resourceId('Microsoft.Authorization/roleAssignments', '66bb4e9e-b016-4a94-8249-4c0511c2be84')
'Private DNS Zone Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'b12aa53e-6015-4669-85d0-8515ebb3ae7f')
'Project Babylon Data Curator': resourceId('Microsoft.Authorization/roleAssignments', '9ef4ef9c-a049-46b0-82ab-dd8ac094c889')
'Project Babylon Data Reader': resourceId('Microsoft.Authorization/roleAssignments', 'c8d896ba-346d-4f50-bc1d-7d1c84130446')
'Project Babylon Data Source Administrator': resourceId('Microsoft.Authorization/roleAssignments', '05b7651b-dc44-475e-b74d-df3db49fae0f')
'Purview role 1 (Deprecated)': resourceId('Microsoft.Authorization/roleAssignments', '8a3c2885-9b38-4fd2-9d99-91af537c1347')
'Purview role 2 (Deprecated)': resourceId('Microsoft.Authorization/roleAssignments', '200bba9e-f0c8-430f-892b-6f0794863803')
'Purview role 3 (Deprecated)': resourceId('Microsoft.Authorization/roleAssignments', 'ff100721-1b9d-43d8-af52-42b69c1272db')
'Quota Request Operator': resourceId('Microsoft.Authorization/roleAssignments', '0e5f05e5-9ab9-446b-b98d-1e2157c94125')
'Reader': resourceId('Microsoft.Authorization/roleAssignments', 'acdd72a7-3385-48ef-bd42-f606fba81ae7')
'Reader and Data Access': resourceId('Microsoft.Authorization/roleAssignments', 'c12c1c16-33a1-487b-954d-41c89c60f349')
'Redis Cache Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'e0f68234-74aa-48ed-b826-c38b57376e17')
'Remote Rendering Administrator': resourceId('Microsoft.Authorization/roleAssignments', '3df8b902-2a6f-47c7-8cc5-360e9b272a7e')
'Remote Rendering Client': resourceId('Microsoft.Authorization/roleAssignments', 'd39065c4-c120-43c9-ab0a-63eed9795f0a')
'Reservation Purchaser': resourceId('Microsoft.Authorization/roleAssignments', 'f7b75c60-3036-4b75-91c3-6b41c27c1689')
'Resource Policy Contributor': resourceId('Microsoft.Authorization/roleAssignments', '36243c78-bf99-498c-9df9-86d9f8d28608')
'Role Based Access Control Administrator (Preview)': resourceId('Microsoft.Authorization/roleAssignments', 'f58310d9-a9f6-439a-9e8d-f62e7b41a168')
'Scheduled Patching Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'cd08ab90-6b14-449c-ad9a-8f8e549482c6')
'Scheduler Job Collections Contributor': resourceId('Microsoft.Authorization/roleAssignments', '188a0f2f-5c9e-469b-ae67-2aa5ce574b94')
'Schema Registry Contributor (Preview)': resourceId('Microsoft.Authorization/roleAssignments', '5dffeca3-4936-4216-b2bc-10343a5abb25')
'Schema Registry Reader (Preview)': resourceId('Microsoft.Authorization/roleAssignments', '2c56ea50-c6b3-40a6-83c0-9d98858bc7d2')
'Search Index Data Contributor': resourceId('Microsoft.Authorization/roleAssignments', '8ebe5a00-799e-43f5-93ac-243d3dce84a7')
'Search Index Data Reader': resourceId('Microsoft.Authorization/roleAssignments', '1407120a-92aa-4202-b7e9-c0e197c71c8f')
'Search Service Contributor': resourceId('Microsoft.Authorization/roleAssignments', '7ca78c08-252a-4471-8644-bb5ff32d4ba0')
'Security Admin': resourceId('Microsoft.Authorization/roleAssignments', 'fb1c8493-542b-48eb-b624-b4c8fea62acd')
'Security Assessment Contributor': resourceId('Microsoft.Authorization/roleAssignments', '612c2aa1-cb24-443b-ac28-3ab7272de6f5')
'Security Detonation Chamber Publisher': resourceId('Microsoft.Authorization/roleAssignments', '352470b3-6a9c-4686-b503-35deb827e500')
'Security Detonation Chamber Reader': resourceId('Microsoft.Authorization/roleAssignments', '28241645-39f8-410b-ad48-87863e2951d5')
'Security Detonation Chamber Submission Manager': resourceId('Microsoft.Authorization/roleAssignments', 'a37b566d-3efa-4beb-a2f2-698963fa42ce')
'Security Detonation Chamber Submitter': resourceId('Microsoft.Authorization/roleAssignments', '0b555d9b-b4a7-4f43-b330-627f0e5be8f0')
'Security Manager (Legacy)': resourceId('Microsoft.Authorization/roleAssignments', 'e3d13bf0-dd5a-482e-ba6b-9b8433878d10')
'Security Reader': resourceId('Microsoft.Authorization/roleAssignments', '39bc4728-0917-49c7-9d2c-d95423bc2eb4')
'Services Hub Operator': resourceId('Microsoft.Authorization/roleAssignments', '82200a5b-e217-47a5-b665-6d8765ee745b')
'SignalR AccessKey Reader': resourceId('Microsoft.Authorization/roleAssignments', '04165923-9d83-45d5-8227-78b77b0a687e')
'SignalR App Server': resourceId('Microsoft.Authorization/roleAssignments', '420fcaa2-552c-430f-98ca-3264be4806c7')
'SignalR REST API Owner': resourceId('Microsoft.Authorization/roleAssignments', 'fd53cd77-2268-407a-8f46-7e7863d0f521')
'SignalR REST API Reader': resourceId('Microsoft.Authorization/roleAssignments', 'ddde6b66-c0df-4114-a159-3618637b3035')
'SignalR Service Owner': resourceId('Microsoft.Authorization/roleAssignments', '7e4f1700-ea5a-4f59-8f37-079cfe29dce3')
'SignalR/Web PubSub Contributor': resourceId('Microsoft.Authorization/roleAssignments', '8cf5e20a-e4b2-4e9d-b3a1-5ceb692c2761')
'Site Recovery Contributor': resourceId('Microsoft.Authorization/roleAssignments', '6670b86e-a3f7-4917-ac9b-5d6ab1be4567')
'Site Recovery Operator': resourceId('Microsoft.Authorization/roleAssignments', '494ae006-db33-4328-bf46-533a6560a3ca')
'Site Recovery Reader': resourceId('Microsoft.Authorization/roleAssignments', 'dbaa88c4-0c30-4179-9fb3-46319faa6149')
'Spatial Anchors Account Contributor': resourceId('Microsoft.Authorization/roleAssignments', '8bbe83f1-e2a6-4df7-8cb4-4e04d4e5c827')
'Spatial Anchors Account Owner': resourceId('Microsoft.Authorization/roleAssignments', '70bbe301-9835-447d-afdd-19eb3167307c')
'Spatial Anchors Account Reader': resourceId('Microsoft.Authorization/roleAssignments', '5d51204f-eb77-4b1c-b86a-2ec626c49413')
'SQL DB Contributor': resourceId('Microsoft.Authorization/roleAssignments', '9b7fa17d-e63e-47b0-bb0a-15c516ac86ec')
'SQL Managed Instance Contributor': resourceId('Microsoft.Authorization/roleAssignments', '4939a1f6-9ae0-4e48-a1e0-f2cbe897382d')
'SQL Security Manager': resourceId('Microsoft.Authorization/roleAssignments', '056cd41c-7e88-42e1-933e-88ba6a50c9c3')
'SQL Server Contributor': resourceId('Microsoft.Authorization/roleAssignments', '6d8ee4ec-f05a-4a1d-8b00-a9b17e38b437')
'Storage Account Backup Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'e5e2a7ff-d759-4cd2-bb51-3152d37e2eb1')
'Storage Account Contributor': resourceId('Microsoft.Authorization/roleAssignments', '17d1049b-9a84-46fb-8f53-869881c3d3ab')
'Storage Account Key Operator Service Role': resourceId('Microsoft.Authorization/roleAssignments', '81a9662b-bebf-436f-a333-f67b29880f12')
'Storage Blob Data Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'ba92f5b4-2d11-453d-a403-e96b0029c9fe')
'Storage Blob Data Owner': resourceId('Microsoft.Authorization/roleAssignments', 'b7e6dc6d-f1e8-4753-8033-0f276bb0955b')
'Storage Blob Data Reader': resourceId('Microsoft.Authorization/roleAssignments', '2a2b9908-6ea1-4ae2-8e65-a410df84e7d1')
'Storage Blob Delegator': resourceId('Microsoft.Authorization/roleAssignments', 'db58b8e5-c6ad-4a2a-8342-4190687cbf4a')
'Storage File Data SMB Share Contributor': resourceId('Microsoft.Authorization/roleAssignments', '0c867c2a-1d8c-454a-a3db-ab2ea1bdc8bb')
'Storage File Data SMB Share Elevated Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'a7264617-510b-434b-a828-9731dc254ea7')
'Storage File Data SMB Share Reader': resourceId('Microsoft.Authorization/roleAssignments', 'aba4ae5f-2193-4029-9191-0cb91df5e314')
'Storage Queue Data Contributor': resourceId('Microsoft.Authorization/roleAssignments', '974c5e8b-45b9-4653-ba55-5f855dd0fb88')
'Storage Queue Data Message Processor': resourceId('Microsoft.Authorization/roleAssignments', '8a0f0c08-91a1-4084-bc3d-661d67233fed')
'Storage Queue Data Message Sender': resourceId('Microsoft.Authorization/roleAssignments', 'c6a89b2d-59bc-44d0-9896-0f6e12d7b80a')
'Storage Queue Data Reader': resourceId('Microsoft.Authorization/roleAssignments', '19e7f393-937e-4f77-808e-94535e297925')
'Storage Table Data Contributor': resourceId('Microsoft.Authorization/roleAssignments', '0a9a7e1f-b9d0-4cc4-a60d-0319b160aaa3')
'Storage Table Data Reader': resourceId('Microsoft.Authorization/roleAssignments', '76199698-9eea-4c19-bc75-cec21354c6b6')
'Stream Analytics Query Tester': resourceId('Microsoft.Authorization/roleAssignments', '1ec5b3c1-b17e-4e25-8312-2acb3c3c5abf')
'Support Request Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'cfd33db0-3dd1-45e3-aa9d-cdbdf3b6f24e')
'Tag Contributor': resourceId('Microsoft.Authorization/roleAssignments', '4a9ae827-6dc8-4573-8ac7-8239d42aa03f')
'Template Spec Contributor': resourceId('Microsoft.Authorization/roleAssignments', '1c9b6475-caf0-4164-b5a1-2142a7116f4b')
'Template Spec Reader': resourceId('Microsoft.Authorization/roleAssignments', '392ae280-861d-42bd-9ea5-08ee6d83b80e')
'Test Base Reader': resourceId('Microsoft.Authorization/roleAssignments', '15e0f5a1-3450-4248-8e25-e2afe88a9e85')
'Traffic Manager Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'a4b10055-b0c7-44c2-b00f-c7b5b3550cf7')
'User Access Administrator': resourceId('Microsoft.Authorization/roleAssignments', '18d7d88d-d35e-4fb5-a5c3-7773c20a72d9')
'Video Indexer Restricted Viewer': resourceId('Microsoft.Authorization/roleAssignments', 'a2c4a527-7dc0-4ee3-897b-403ade70fafb')
'Virtual Machine Administrator Login': resourceId('Microsoft.Authorization/roleAssignments', '1c0163c0-47e6-4577-8991-ea5c82e286e4')
'Virtual Machine Contributor': resourceId('Microsoft.Authorization/roleAssignments', '9980e02c-c2be-4d73-94e8-173b1dc7cf3c')
'Virtual Machine Local User Login': resourceId('Microsoft.Authorization/roleAssignments', '602da2ba-a5c2-41da-b01d-5360126ab525')
'Virtual Machine User Login': resourceId('Microsoft.Authorization/roleAssignments', 'fb879df8-f326-4884-b1cf-06f3ad86be52')
'VM Scanner Operator': resourceId('Microsoft.Authorization/roleAssignments', 'd24ecba3-c1f4-40fa-a7bb-4588a071e8fd')
'Web Plan Contributor': resourceId('Microsoft.Authorization/roleAssignments', '2cc479cb-7b4d-49a8-b449-8c00fd0f0a4b')
'Web PubSub Service Owner (Preview)': resourceId('Microsoft.Authorization/roleAssignments', '12cf5a90-567b-43ae-8102-96cf46c7d9b4')
'Web PubSub Service Reader (Preview)': resourceId('Microsoft.Authorization/roleAssignments', 'bfb1c7d2-fb1a-466b-b2ba-aee63b92deaf')
'Website Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'de139f84-1756-47ae-9be6-808fbbe84772')
'Windows Admin Center Administrator Login': resourceId('Microsoft.Authorization/roleAssignments', 'a6333a3e-0164-44c3-b281-7a577aff287f')
'Workbook Contributor': resourceId('Microsoft.Authorization/roleAssignments', 'e8ddcd69-c73f-4f9f-9844-4100522f16ad')
'Workbook Reader': resourceId('Microsoft.Authorization/roleAssignments', 'b279062a-9be3-42a0-92ae-8b3cf002ec4d')
'WorkloadBuilder Migration Agent Role': resourceId('Microsoft.Authorization/roleAssignments', 'd17ce0a2-0697-43bc-aac5-9113337ab61c')

}



resource roleAssignment 'Microsoft.Authorization/roleAssignments@2020-10-01-preview' = {
  name: guid(resourceGroup().id, parPrincipalId, varRoleIds[parRoleName])
  properties: {
    roleDefinitionId: varRoleIds[parRoleName]
    principalId: parPrincipalId
    principalType: parPrincipalType
  }
}






