targetScope = 'resourceGroup'
@description('Location for all resources.')
param location string = resourceGroup().location
param tags object = resourceGroup().tags
@description('The name of the Azure Databricks workspace to create.')
param workspaceName string = 'dbws-anineharto-sandbox'
@description('The pricing tier of workspace.')
@allowed([
  'standard'
  'premium'
])
param pricingTier string = 'premium'
param managedResourceGroupName string = 'rg-${workspaceName}'


resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'staninehartosandbox'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  tags: tags

  resource blobService 'blobServices' = {
    name: 'default'

    resource metastore 'containers' = {
      name: 'metastore'
    }

    resource merchantProfileChangedEventsRaw 'containers' = {
      name: 'merchant-profile-changed-events-raw'
    }
  }
}

resource databricksWorkspace 'Microsoft.Databricks/workspaces@2023-02-01' = {
  name: workspaceName
  location: location
  sku: {
    name: pricingTier
  }
  properties: {
    managedResourceGroupId: managedResourceGroup.id
  }
  tags: tags
}
resource managedResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' existing = {
  scope: subscription()
  name: managedResourceGroupName
}

resource accessConnector 'Microsoft.Databricks/accessConnectors@2022-10-01-preview' = {
  name: 'dbac-anineharto-sandbox'
  location: location
  tags: tags
}
