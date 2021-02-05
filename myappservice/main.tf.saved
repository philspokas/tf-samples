variable client_id {}
variable tenant_id {}
variable subscription_id {}
variable client_secret {}

provider "azurerm" {
    version         = "2.24"
    subscription_id = var.subscription_id
    features {}
}

module "appinsights"{
    source                = "git::https://bitbucket.micron.com/bbdc/scm/cloudstds/azure.git//terraform//appinsights"
    resource_group_name   = "Test01"
    app_insights_name     = "myappinsghts"
    app_insights_app_type = "web"
    subscription_id       = var.subscription_id
    client_secret         = var.client_secret
    client_id             = var.client_id
    tenant_id             = var.tenant_id
}

module "appservice"{
    source                           = "git::https://bitbucket.micron.com/bbdc/scm/cloudstds/azure.git//terraform/appservice"
    service_name                     = "myappservice"
    resource_group_name              = "Test01"
    app_insights_instrumentation_key = module.appinsights.app_insights_instrumentation_key
    subscription_id                  = var.subscription_id
    client_id                        = var.client_id
    tenant_id                        = var.tenant_id
    client_secret                    = var.client_secret
}