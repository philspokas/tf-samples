variable client_id {}
variable tenant_id {}
variable subscription_id {}
variable client_secret {}
variable input_resource_group_name {}

provider "azurerm" {
    version = "2.29"
    features {}   
}

# module "logicappworkflow" {
#     for_each = toset(["la-pcstest-01","la-pcs-02","la-pcs-03"])
#     source                   = "c:/users/pspokas/dev/azure/terraform/logicappworkflow"
#     workflow_name            = "${each.key}"
#     resource_group_name      = var.input_resource_group_name
#     subscription_id          = var.subscription_id
#     client_id                = var.client_id
#     tenant_id                = var.tenant_id
#     client_secret            = var.client_secret
# }

module "logicappworkflow" {
    source                   = "git::https://bitbucket.micron.com/bbdc/scm/cloudstds/azure.git//terraform/logicappworkflow?ref=features/logic-app-workflow"
    workflow_name            = "la-pcstest-01"
    resource_group_name      = var.input_resource_group_name
    subscription_id          = var.subscription_id
    client_id                = var.client_id
    tenant_id                = var.tenant_id
    client_secret            = var.client_secret
}

module "servicebus" {
    source              = "git::https://bitbucket.micron.com/bbdc/scm/cloudstds/azure.git//terraform/servicebus?ref=features/logic-app-workflow"
    namespace_name      = "sb-pcstest-01"
    resource_group_name = var.input_resource_group_name
    subnet_id           = ""
    subscription_id     = var.subscription_id
    client_id           = var.client_id
    tenant_id           = var.tenant_id
    client_secret       = var.client_secret 
}


