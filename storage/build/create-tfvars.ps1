$vars = @(
    "storage_name=`"$($env:storage_name)`"",
    "resource_group_name=`"$($env:resource_group_name)`"",
    "vnet_resource_group_name=`"$($env:vnet_resource_group_name)`"",
    "vnet_name=`"$($env:vnet_name)`"",
    "subnet_name = `"$($env:subnet_name)`"",
    "BusinessUnit = `"BU`"",
    "Contact = `"pspokas@micron.com`"",
    "CostCenter = `"10351`"",
    "Environment = `"dev`"",
    "Tier = `"3`"",
    "client_id=`"$($env:ARM_CLIENT_ID)`"",
    "tenant_id=`"$($env:ARM_TENANT_ID)`"",
    "subscription_id=`"$($env:ARM_SUBSCRIPTION_ID)`"",
    "client_secret=`"$($env:ARM_CLIENT_SECRET)`""
)
Set-Content -Path ".\terraform.tfvars" -value $vars