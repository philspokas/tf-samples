variable client_id {}
variable tenant_id {}
variable subscription_id {}
variable client_secret {}
variable resource_group_name {}
variable BusinessUnit {}
variable Contact {}
variable CostCenter {}
variable Environment {}
variable Tier {}

terraform {
    backend "azurerm" {
    }
}

provider "azurerm" {
    version = "2.47"
    features {}   
}

module "logicappworkflow" {
    source                   = "git::https://bitbucket.micron.com/bbdc/scm/cloudstds/azure.git//terraform/logicappworkflow?ref=logicappworkflow/1.0.0"
    workflow_name            = "la-pcstest-03"
    resource_group_name      = var.resource_group_name
    subscription_id          = var.subscription_id
    client_id                = var.client_id
    tenant_id                = var.tenant_id
    client_secret            = var.client_secret
    use_integration_service  = false
    BusinessUnit = var.BusinessUnit
    Contact = var.Contact
    CostCenter = var.CostCenter
    Environment = var.Environment
    Tier = var.Tier
}

module "servicebus" {
    source                      = "git::https://bitbucket.micron.com/bbdc/scm/cloudstds/azure.git//terraform/servicebus?ref=servicebus/1.0.0"
    namespace_name              = "sb-pcstest-03"
    resource_group_name         = var.resource_group_name
    subscription_id             = var.subscription_id
    client_id                   = var.client_id
    tenant_id                   = var.tenant_id
    client_secret               = var.client_secret 
    vnet_resource_group_name    = ""
    vnet_name                   = ""
    subnet_name                 = ""
    private_endpoint_enabled    = "false"
}

