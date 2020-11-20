$vars = @(
    "workflow_name=`"$($env:workflow_name)`"",
    "resource_group_name=`"$($env:resource_group_name)`"",
    "vnet_resource_group_name=`"$($env:vnet_resource_group_name)`"",
    "vnet_name=`"$($env:vnet_name)`"",
    "use_integration_service=`"$($env:use_integration_service)`""
)
Set-Content -Path ".\main.tfvars" -Value $vars