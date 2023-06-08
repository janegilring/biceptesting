targetScope = 'managementGroup'

metadata name = 'Custom Policy Defitions at Management Group Scope'
metadata description = 'This policy definition is used to deploy custom policy definitions at management group scope'

@sys.description('The management group scope to which the policy definitions are to be created at.')
param parDeploymentLocation string

resource customPolicyDefinitionDeployment 'Microsoft.Resources/deployments@2022-09-01' = {
  name: 'customPolicyDefinitionTSDeploy'
  location: parDeploymentLocation
  scope: managementGroup()
  properties: {
    mode: 'Incremental'
    templateLink: {
      id: resourceId('72949fb8-297a-4da5-bfed-aed671c680d0', 'template-spec-rg', 'Microsoft.Resources/templateSpecs/versions', 'customPolicyDefinitions', 'v1.0')
    }
    parameters: {
      //parTargetManagementGroupId: { value: 'psc' }
      //parDeploymentLocation: { value: 'northeurope' }
    }
  }
}
