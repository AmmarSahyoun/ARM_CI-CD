@description('Name of the Synapse Workspace')
param synapseWorkspaceName string

@description('Location for the Synapse Workspace')
param location string

@description('Name of the default Data Lake Storage account')
param defaultDataLakeStorageAccountName string

@description('File system name for the default Data Lake Storage')
param defaultDataLakeFileSystemName string

resource synapse 'Microsoft.Synapse/workspaces@2021-06-01' = {
  name: synapseWorkspaceName
  location: location
  properties: {
    defaultDataLakeStorage: {
      accountUrl: 'https://${defaultDataLakeStorageAccountName}.dfs.core.windows.net'
      filesytem: defaultDataLakeFileSystemName
    }
  }
}
