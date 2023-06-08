targetScope = 'managementGroup'

metadata name = 'ALZ Bicep - Policy Module'
metadata description = 'ALZ Bicep Module used to set up Azure Policy definitions and assignments'

@sys.description('Deployment location for nested deployment.')
param parDeploymentLocation string = 'northeurope'


module modCustomPolicyDefinitions './nested.bicep' = {
  name: 'deploy-CustomPolicyDefinitions-TemplateSpec'
  params: {
    parDeploymentLocation: parDeploymentLocation
  }
}
