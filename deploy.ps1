$TemplateSpecsRgName = 'template-spec-rg'
$templateSpecIdentifier = 'customPolicyDefinitions'
$ModuleVersion = 'v1.0'
$TemplateSpecsDescription = 'Azure policies'
$TemplateSpecsRgLocation = 'northeurope'
$TemplateFilePath = '/tmp/biceptesting/modules/policy/customPolicyDefinitions.bicep'

New-AzResourceGroup -Name $TemplateSpecsRgName -Location $TemplateSpecsRgLocation

$templateSpecInputObject = @{
  ResourceGroupName = $TemplateSpecsRgName
  Name              = $templateSpecIdentifier
  Version           = $ModuleVersion
  Description       = $TemplateSpecsDescription
  Location          = $TemplateSpecsRgLocation
  TemplateFile      = $TemplateFilePath
  }

New-AzTemplateSpec @templateSpecInputObject -Force

New-AzSubscriptionDeployment -Name PolicyTest -Location 'northeurope' -TemplateFile ./main.bicep