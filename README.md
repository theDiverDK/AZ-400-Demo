# AZ-400 Demo

A compact Azure DevOps/AZ-400 demonstration focused on provisioning an Azure Key Vault and granting access to a GitHub application or service principal.

## Contents

- [`KeyVault/KeyVaultSetup.sh`](KeyVault/KeyVaultSetup.sh) — creates a resource group and Key Vault, assigns RBAC roles, and creates sample secrets.
- [`.github/workflows/GetValuesFromKeyVault.yaml`](.github/workflows/GetValuesFromKeyVault.yaml) — GitHub Actions workflow related to retrieving Key Vault values.

## Prerequisites

- Azure CLI (`az`) signed in to the target subscription.
- Permission to create resource groups, Key Vaults, role assignments, and secrets.
- A GitHub application/service principal when using the script's GitHub access example.

## Use

1. Open `KeyVault/KeyVaultSetup.sh` and replace the sample subscription, resource group, location, Key Vault name, and application client ID.
2. Review the sample secrets and replace them with non-sensitive test values if needed.
3. Run the script from a Bash-compatible shell:

   ```bash
   bash KeyVault/KeyVaultSetup.sh
   ```

4. Configure the GitHub Actions workflow with the required Azure credentials and Key Vault values.

## Security note

The script contains example identifiers and dummy secret values for demonstration only. Do not commit real credentials or production secrets to this repository.
