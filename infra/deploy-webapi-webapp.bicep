param location string = resourceGroup().location




resource appServicePlan 'Microsoft.Web/serverfarms@2018-02-01' = { 
  name: 'webapp-plan'
  location: location
  sku: {
    name: 'S1'
    tier: 'Standard'
  }


}

resource webApp 'Microsoft.Web/sites@2018-02-01' = { 
  name: 'webapp'
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlan.id
    
  }
}
