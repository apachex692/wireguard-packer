# Packer Template for WireGuard Ubuntu 22.04 LTS Image on Azure and AWS

- **Author:** InferenceFailed Developers
- **Created on:** 07/01/2024

## GitHub

Create a classic personal access token in GitHub by navigating to Settings → Developer Settings → Personal Access Tokens → Tokens (classic) → Generate New Token. Now, copy the token somewhere securely and export it to shell as follows:

```sh
export PKR_VAR_github_pat=<github-pat>
```

## AWS

To create an AMI (Amazon Machine Image) on AWS, export the following variables to the shell as follows:

```sh
export AWS_ACCESS_KEY_ID=<access-key-id>
export AWS_SECRET_ACCESS_KEY=<secret-access-key>
export AWS_REGION=<aws-region>
```

## Azure

Azure, as usual is bit tedious to set-up when compared to AWS. Firstly, make sure Azure CLI is installed on your machine. Now, get the subscription ID as follows:

```sh
az account show --query "{ subscription_id: id }"
```

Get the client ID, client secret and tenant ID with the following command. Make sure to replace the `<subscription-id>` with your subscription ID.

```sh
az ad sp create-for-rbac --role Contributor --scopes /subscriptions/<subscription-id> --query "{ client_id: appId, client_secret: password, tenant_id: tenant }"
```

Now, create a resource group with the following command. Feel free to choose a resource name and location as per your likings.

```sh
az group create -n wireguard-ubuntu -l centralindia
```

Export the following environment variables with the secrets obtained from preceeding steps. The commands are listed below:

```sh
export PKR_VAR_azure_client_id=<client-id>
export PKR_VAR_azure_client_secret=<client-secret>
export PKR_VAR_azure_subscription_id=<subscription-id>
export PKR_VAR_azure_tenant_id=<tenant-id>
```

## Building Image with Packer

**Note:** The HCL scripts builds images for both AWS and Azure. Make sure to comment-out either one if you're not willing to deploy.

Make sure to modify the `./scripts/user-data.sh` according to your needs before proceeding. The final steps are to initialize the integration modules, format, validate and build the images.

```sh
packer init ./
packer validate ./ && packer fmt ./
packer build ./
```
