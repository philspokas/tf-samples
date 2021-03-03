#
# Configure resources needed for Terraform pipeline
#

variable client_id {}
variable tenant_id {}
variable subscription_id {}
variable client_secret {}
variable storage_name {}
variable resource_group_name {}
variable tags {}
variable vnet_name {}
variable vnet_resource_group_name {}
variable subnet_name {}

provider "azurerm" {
    version = "2.47"
    features {}   
}

module "storageaccount" {
    source                   = "git::https://bitbucket.micron.com/bbdc/scm/cloudstds/azure.git//terraform/storageaccount"
    storage_name             = var.storage_name
    storage_type             = ["blob"]
    private_endpoint_enabled  = false
    resource_group_name      = var.resource_group_name
    subscription_id          = var.subscription_id
    client_id                = var.client_id
    tenant_id                = var.tenant_id
    client_secret            = var.client_secret
    tags             = var.tags
    vnet_name                = var.vnet_name
    vnet_resource_group_name = var.vnet_resource_group_name
    subnet_name              = var.subnet_name
}

output "storage_account_name" {
    value = module.storageaccount.storage_account_name
}
output "storage_account_id" {
    value = module.storageaccount.storage_account_id
}
output "storage_account_access_key" {
    value = module.storageaccount.storage_account_access_key
}

module "servicebusnamespace" {
    source = "git::https://bitbucket.micron.com/bbdc/scm/cloudstds/azure.git//terraform/servicebusnamespace"
    namespace_name = "tfdeploy"
    private_endpoint_enabled = false
    subscription_id          = var.subscription_id
    client_id                = var.client_id
    tenant_id                = var.tenant_id
    client_secret            = var.client_secret    
    resource_group_name = var.resource_group_name
    vnet_name                = ""
    vnet_resource_group_name = ""
    subnet_name              = ""
    tags = var.tags
}

output "servicebus_namespace_name" {
    value = module.servicebusnamespace.servicebus_namespace_name
}

output "servicebus_namespace_id" {
    value = module.servicebusnamespace.servicebus_namespace_id
}