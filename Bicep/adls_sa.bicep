resource testadls016 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: 'testadls016'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}
