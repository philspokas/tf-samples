variable client_id {}
variable tenant_id {}
variable subscription_id {}
variable client_secret {}
variable input_resource_group_name {}
variable input_tags {}
variable log_analytics_subscription_id { default = "d7584753-660e-4684-9cbf-33411d2e76df" }
variable dns_subscription_id { default = "f73348b5-5cc4-4b54-bb7b-89a75290b8b8" }
variable input_vnet_name {}
variable input_workflow_name {}
variable input_namespace_name {}

terraform {
    backend "azurerm" {
    }
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = ">= 2.38"
        }
    }
}

provider "azurerm" {
    subscription_id = var.subscription_id
    client_secret   = var.client_secret
    client_id       = var.client_id
    tenant_id       = var.tenant_id
    features {}
}

provider "azurerm" {
    alias           = "prod"
    skip_provider_registration = true
    subscription_id = var.log_analytics_subscription_id
    client_secret   = var.client_secret
    client_id       = var.client_id
    tenant_id       = var.tenant_id
    features {}
}

provider "azurerm" {
    alias                      = "dns"
    subscription_id            = var.dns_subscription_id
    client_secret              = var.client_secret
    client_id                  = var.client_id
    tenant_id                  = var.tenant_id
    skip_provider_registration = true
    features {}
}

module "resourcegroup" {
    source              = "git::https://bitbucket.micron.com/bbdc/scm/cloudstds/azure.git//terraform/resourcegroup?ref=resourcegroup/1.0.1"
    resource_group_name = var.input_resource_group_name
    subscription_id     = var.subscription_id
    client_id           = var.client_id
    client_secret       = var.client_secret
    tenant_id           = var.tenant_id
    tags                = var.input_tags
}

module "logicappworkflow" {
    source                   = "git::https://bitbucket.micron.com/bbdc/scm/cloudstds/azure.git//terraform/logicappworkflow?logicappworkflow/2.0.0"
    workflow_name            = var.input_workflow_name
    resource_group_name      = var.input_resource_group_name
    use_integration_service  = false
    tags = var.input_tags

    providers = {
        azurerm.prod = azurerm.prod
    }
}

module "servicebus" {
    source                      = "git::https://bitbucket.micron.com/bbdc/scm/cloudstds/azure.git//terraform/servicebusnamespace"
    namespace_name              = var.input_namespace_name
    resource_group_name         = var.input_resource_group_name
    client_id                   = var.client_id
    tenant_id                   = var.tenant_id
    client_secret               = var.client_secret 
    tags = var.input_tags
    vnet_resource_group_name    = ""
    vnet_name                   = ""
    subnet_name                 = ""
    private_endpoint_enabled    = false

    providers = {
        azurerm.prod = azurerm.prod
        azurerm.dns  = azurerm.dns
    }
}

