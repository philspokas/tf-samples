variable client_id {}
variable tenant_id {}
variable subscription_id {}
variable client_secret {}
variable resource_group_name {}
variable tags {}

terraform {
    backend "azurerm" {
    }
}

provider "azurerm" {
    version = "2.47"
    features {}   
}

module "logicappworkflow" {
    source                   = "git::https://bitbucket.micron.com/bbdc/scm/cloudstds/azure.git//terraform/logicappworkflow"
    workflow_name            = "la-pcstest-03"
    resource_group_name      = var.resource_group_name
    subscription_id          = var.subscription_id
    client_id                = var.client_id
    tenant_id                = var.tenant_id
    client_secret            = var.client_secret
    use_integration_service  = false
    tags = var.tags

}

module "servicebus" {
    source                      = "git::https://bitbucket.micron.com/bbdc/scm/cloudstds/azure.git//terraform/servicebusnamespace"
    namespace_name              = "sb-pcstest-03"
    resource_group_name         = var.resource_group_name
    subscription_id             = var.subscription_id
    client_id                   = var.client_id
    tenant_id                   = var.tenant_id
    client_secret               = var.client_secret 
    tags = var.tags
    vnet_resource_group_name    = ""
    vnet_name                   = ""
    subnet_name                 = ""
    private_endpoint_enabled    = "false"
}

