$vars = @(
    "storage_name=`"$($env:workflow_name)`"",
    "storage_type=`"blob`"",
    "resource_group_name=`"$($env:resource_group_name)`"",
    "vnet_resource_group_name=`"$($env:vnet_resource_group_name)`"",
    "vnet_name=`"$($env:vnet_name)`"",
    "subnet_name= = `"$($env:subnet_name)`"",
    "BusinessUnit = `"BU`"",
    "Contact = `"pspokas@micron.com`"",
    "CostCenter = `"10351`"",
    "Environment = `"dev`"",
    "Tier = `"3`""
)
Set-Content -Path ".\main.tfva"