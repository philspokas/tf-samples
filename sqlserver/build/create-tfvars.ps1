$vars = @(
    "input_sql_server_name=`"$($env:sql_server_name)`"",
    "input_server_admin_login=`"$($env:server_admin_login)`"",
    "input_database_name=`"$($env:input_database_name)`"",
    "input_resource_group_name=`"$($env:resource_group_name)`"",
    "input_vnet_resource_group_name=`"$($env:vnet_resource_group_name)`"",
    "input_vnet_name=`"$($env:vnet_name)`"",
    "input_subnet_name=`"$($env:subnet_name)`"",
    "input_tags= { BusinessUnit = `"BU`", Contact = `"pspokas@micron.com`", CostCenter = `"10351`", Environment = `"dev`", Tier = `"3`"}"
)
Set-Content -Path ".\main.auto.tfvars" -Value $vars
