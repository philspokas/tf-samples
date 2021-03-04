$vars = @(
    "input_workflow_name=`"$($env:workflow_name)`"",
    "input_namespace_name=`"$($env:namespace_name)`"",
    "input_resource_group_name=`"$($env:resource_group_name)`"",
    "input_vnet_resource_group_name=`"$($env:vnet_resource_group_name)`"",
    "input_vnet_name=`"$($env:vnet_name)`"",
    "input_tags= { BusinessUnit = `"BU`", Contact = `"pspokas@micron.com`", CostCenter = `"10351`", Environment = `"dev`", Tier = `"3`"}"
)
Set-Content -Path ".\main.auto.tfvars" -Value $vars
