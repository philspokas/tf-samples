variable client_id {}
variable tenant_id {}
variable subscription_id {}
variable client_secret {}
variable input_resource_group_name {}


provider "azurerm" {
    version = "2.30"
    features {}   
}


# module "logicappworkflow" {
#     source                   = "git::https://bitbucket.micron.com/bbdc/scm/cloudstds/azure.git//terraform/logicappworkflow?ref=features/logic-app-workflow"
#     workflow_name            = "la-pcstest-01"
#     resource_group_name      = var.input_resource_group_name
#     subscription_id          = var.subscription_id
#     client_id                = var.client_id
#     tenant_id                = var.tenant_id
#     client_secret            = var.client_secret
# }

#    source                      = "git::https://bitbucket.micron.com/bbdc/scm/cloudstds/azure.git//terraform/servicebus?ref=features/logic-app-workflow"


module "servicebus" {
    source                      = "git::https://bitbucket.micron.com/bbdc/scm/cloudstds/azure.git//terraform/servicebus?ref=updates/service-bus-private-link"
    namespace_name              = "sb-pcstest-02"
    resource_group_name         = var.input_resource_group_name
    subscription_id             = var.subscription_id
    client_id                   = var.client_id
    tenant_id                   = var.tenant_id
    client_secret               = var.client_secret 
    vnet_resource_group_name    = var.input_resource_group_name
    vnet_name                   = "vnet-dev-vmtest"
    subnet_name                 = "subnet-jmtest"
    private_endpoint_enabled    = "true"
}



