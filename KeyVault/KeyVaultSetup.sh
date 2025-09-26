# Variables (replace with your own)
SUBSCRIPTION_ID="8ed210d1-9420-4e71-968d-a73398093c77"
RESOURCE_GROUP="demo-rg"
LOCATION="westeurope"
KEYVAULT_NAME="githubkeyvaultdemo"
APP_CLIENT_ID="5d9430f8-f955-4d5d-8a4e-49ed65ec8d65"

# Make sure you are logged in and set the subscription
az login
az account set --subscription $SUBSCRIPTION_ID

# 1. Create a resource group (if it doesn't exist)
az group create \
  --name $RESOURCE_GROUP \
  --location $LOCATION

# 2. Create the Key Vault
az keyvault create \
  --name $KEYVAULT_NAME \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION \
  --enable-rbac-authorization true

# 3. (One time, required) Give *your current logged-in user* permission
#    to manage Key Vault secrets (so you can create the secrets).
CURRENT_USER=$(az ad signed-in-user show --query id -o tsv)
KEYVAULT_SCOPE=$(az keyvault show -n $KEYVAULT_NAME -g $RESOURCE_GROUP --query id -o tsv)


az role assignment create --role "Key Vault Secrets Officer" \ 
    --assignee soren@reinke.dk --scope $KEYVAULT_SCOPE


# az role assignment create \
#   --role "Key Vault Secrets Officer" \
#   --assignee $CURRENT_USER \
#   --scope $KEYVAULT_SCOPE

# # 4. Assign the GitHub App Registration (service principal) the "Key Vault Secrets User" role
# az role assignment create \
#   --role "Key Vault Secrets User" \
#   --assignee $APP_CLIENT_ID \
#   --scope $KEYVAULT_SCOPE

# # 5. Add three dummy secrets
# az keyvault secret set \
#   --vault-name $KEYVAULT_NAME \
#   --name "DB-PASSWORD" \
#   --value "MyDummyPassword123!"

# az keyvault secret set \
#   --vault-name $KEYVAULT_NAME \
#   --name "API-TOKEN" \
#   --value "DummyApiToken-XYZ"

# az keyvault secret set \
#   --vault-name $KEYVAULT_NAME \
#   --name "CONNECTION-STRING" \
#   --value "Server=myserver;Database=mydb;User Id=dummy;Password=secret;"
