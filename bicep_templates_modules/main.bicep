targetScope = 'subscription'

@description('Location for all resources')
param location string = 'westeurope'

@description('Name of the resource group')
param resourceGroupName string = 'myproject-resources-rg'

@description('Name of the Storage Account')
param storageAccountName string = 'myprojectadlsbicep'

@description('Name of the Synapse Workspace')
param synapseWorkspaceName string = 'myproject-synapse'

@description('File system name for the default Data Lake Storage')
param defaultDataLakeFileSystemName string = 'synapsefs'

module resourceGroupModule './modules/resourceGroup.bicep' = {
  name: 'deployResourceGroup'
  params: {
    resourceGroupName: resourceGroupName
    location: location
  }
}

module adlsModule './modules/adls.bicep' = {
  name: 'deployAdls'
  scope: resourceGroup(resourceGroupName)
  params: {
    storageAccountName: storageAccountName
    location: location
  }
  dependsOn: [resourceGroupModule]
}

module synapseModule './modules/synapse.bicep' = {
  name: 'deploySynapse'
  scope: resourceGroup(resourceGroupName)
  params: {
    synapseWorkspaceName: synapseWorkspaceName
    location: location
    defaultDataLakeStorageAccountName: storageAccountName
    defaultDataLakeFileSystemName: defaultDataLakeFileSystemName
  }
  dependsOn: [adlsModule]
}
