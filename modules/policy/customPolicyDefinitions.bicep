targetScope = 'managementGroup'

metadata name = 'Custom Policy Definitions at Management Group Scope'
metadata description = 'This policy definition is used to deploy custom policy definitions at management group scope'


var varCustomPolicyDefinitionsArray = [
  {
    name: 'Append-AppService-httpsonly'
    libDefinition: loadJsonContent('definitions/policy_definition_es_Append-AppService-httpsonly.json')
  }
]

resource resPolicyDefinitions 'Microsoft.Authorization/policyDefinitions@2021-06-01' = [for policy in varCustomPolicyDefinitionsArray: {
  name: policy.libDefinition.name
  properties: {
    description: policy.libDefinition.properties.description
    displayName: policy.libDefinition.properties.displayName
    metadata: policy.libDefinition.properties.metadata
    mode: policy.libDefinition.properties.mode
    parameters: policy.libDefinition.properties.parameters
    policyType: policy.libDefinition.properties.policyType
    policyRule: policy.libDefinition.properties.policyRule
  }
}]
