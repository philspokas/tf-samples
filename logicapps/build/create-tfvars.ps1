$vars = @(
    "workflow_name=`"$($env:workflow_name)`"",
    "resource_group_name=`"$($env:resource_group_name)`"",
    "vnet_resource_group_name=`"$($env:vnet_resource_group_name)`"",
    "vnet_name=`"$($env:vnet_name)`"",
    "tags= { BusinessUnit = `"BU`", Contact = `"pspokas@micron.com`", CostCenter = `"10351`", Environment = `"dev`", Tier = `"3`"}"
)
Set-Content -Path ".\main.auto.tfvars" -Value $vars
