targetScope = 'subscription'

@description('Name of the resource group to create')
param resourceGroupName string

@description('Location of the resource group')
param location string

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

output resourceGroupName string = rg.name
