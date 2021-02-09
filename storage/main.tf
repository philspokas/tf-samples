variable client_id {}
variable tenant_id {}
variable subscription_id {}
variable client_secret {}
variable resource_group_name {}

provider "azurerm" {
    version = "2.30"
    features {}   
}

module "storageaccount" {
    source                   = "git::https://bitbucket.micron.com/bbdc/scm/cloudstds/azure.git//terraform/storageaccount?ref=storageaccount/1.0.1"
    storage_name            = var.storage_name
    storage_type            = "blob"
    resource_group_name      = var.resource_group_name
    subscription_id          = var.subscription_id
    client_id                = var.client_id
    tenant_id                = var.tenant_id
    client_secret            = var.client_secret
    BusinessUnit = "BU"
    Contact = "pspokas@micron.com"
    CostCenter = "10351"
    Environment = "dev"
    Tier = "3"
}
