#!/bin/bash
#
# Author: InferenceFailed Developers
# Created on: 07/01/2024
az group create -n wireguard-ubuntu -l centralindia

az ad sp create-for-rbac --role Contributor --scopes /subscriptions/<subscription_id> --query "{ client_id: appId, client_secret: password, tenant_id: tenant }"

az account show --query "{ subscription_id: id }"
