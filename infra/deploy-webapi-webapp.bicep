param location string = resourceGroup().location




resource appServicePlan 'Microsoft.Web/serverfarms@2018-02-01' = { 
  name: 'webapp-plan'
  location: location

  sku: {
      
    name: 'S1'
    tier: 'Standard'
  }
  properties: {
    
  }


}

resource webApp 'Microsoft.Web/sites@2018-02-01' = { 
  name: 'webapp-124153124125115b'
  location: location
  kind: 'app'
  properties: {
    
    serverFarmId: appServicePlan.id
    siteConfig: {
  
      
    }
    
  }
}


resource webAppDeploymentConfig  'Microsoft.Web/sites/sourcecontrols@2022-03-01' = {
  name: 'web'
  parent: webApp
  properties: {
    isGitHubAction: false
    isManualIntegration: true
    repoUrl: 'https://github.com/brentos99/az-104-test/'
    branch: 'main'
  }
}

