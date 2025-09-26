# Keyvault Demo

1. A Github Action Workflow in the **Action** folder
2. An Azure Devops Pipeline example in the **Pipeline** folder

## Setup
### Github Action Workflow


#### Create an Azure App Registration 
1. **Go to your App Registration**
   - Open the [Azure Portal](https://portal.azure.com).
   - Search for **App registrations**.
   - Select your existing app (or create a new one).

2. **Add Federated Credential**
   - In the left blade, select **Certificates & secrets → Federated credentials**.
   - Click **Add credential**.
   - Fill out the form:
     - **Federated credential scenario** → choose *GitHub Actions deploying Azure resources*.
     - **Organization** → your GitHub org name.
     - **Repository** → the repo name.
     - **Entity type** → normally “Branch”.
     - **Branch/tag/environment** → e.g. `main`.
     - **Name** → any descriptive name like `gh-main-oidc`.
   - Save it.
3. **Get Client ID, Tenant ID, and Subscription ID**

   - **Client ID**
     - Go to your App Registration in the Azure Portal.
     - On the **Overview** page, copy the value shown as **Application (client) ID**.

   - **Tenant ID**
     - Still on the **Overview** page of the App Registration, copy the value shown as **Directory (tenant) ID**.

   - **Subscription ID**
     - In the Azure Portal, search for **Subscriptions**.
     - Select your active subscription.
     - On the **Overview** page, copy the value shown as **Subscription ID**.

4. **Add Values as GitHub Secrets**

   - Go to your repository on GitHub.  
   - Click **Settings** (top menu).  
   - In the left sidebar, select **Secrets and variables → Actions**.  
   - Click the **New repository secret** button.  
   - Add each value one by one:
     - **Name:** `AZURE_TENANT_ID` → **Value:** paste the Tenant ID you copied.  
     - **Name:** `AZURE_SUBSCRIPTION_ID` → **Value:** paste the Subscription ID you copied.  
     - **Name:** `AZURE_CLIENT_ID` → **Value:** paste the Client ID you copied.  
   - Click **Add secret** after entering each one.  

   > You should now see the three secrets listed in your repository secrets.






Go to your fork of the repository, 
- Click **Settings**
- Unfold **Secrets and Variable** in the left hand menu
- Select **Actions**
