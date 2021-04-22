variable client_id {}
variable tenant_id {}
variable subscription_id {}
variable client_secret {}
variable input_vnet_resource_group_name {}
variable input_vnet_name {}
variable input_subnet_name {}
variable input_resource_group_name {}
variable input_server_admin_login {}
variable input_sql_server_name {}
variable input_database_name {}
variable input_tags {}

terraform {
    backend "azurerm" {
    }
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "2.47"
        }
    }
}

provider "azurerm" {
    subscription_id            = var.subscription_id
    client_secret              = var.client_secret
    client_id                  = var.client_id
    tenant_id                  = var.tenant_id
    features {}
}

provider "azurerm" {
    alias                      = "dns"
    subscription_id            = "f73348b5-5cc4-4b54-bb7b-89a75290b8b8"
    client_secret              = var.client_secret
    client_id                  = var.client_id
    tenant_id                  = var.tenant_id
    skip_provider_registration = true
    features {}
}

module "resourcegroup" {
    source              = "git::https://bitbucket.micron.com/bbdc/scm/cloudstds/azure.git//terraform/resourcegroup"
    resource_group_name = var.input_resource_group_name
    tags                = var.input_tags
}

module "sqlserver" {
    source                   = "git::https://bitbucket.micron.com/bbdc/scm/cloudstds/azure.git//terraform/sqlserver?ref=updates/log-analytics"
    resource_group_name      = var.input_resource_group_name
    server_admin_login       = var.input_server_admin_login
    sql_server_name          = var.input_sql_server_name
    database_name            = var.input_database_name
    subnet_name              = var.input_subnet_name
    vnet_name                = var.input_vnet_name
    vnet_resource_group_name = var.input_vnet_resource_group_name
    client_id                = var.client_id
    tenant_id                = var.tenant_id
    client_secret            = var.client_secret
    tags                     = var.input_tags
    providers = {
        azurerm.dns  = azurerm.dns
    }
    depends_on = [module.resourcegroup]
}

output "sql_server_name" {
    value = module.sqlserver.sql_server_name
}
