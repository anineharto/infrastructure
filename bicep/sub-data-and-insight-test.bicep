targetScope = 'subscription'
param location string = 'westeurope'
param utcDate string = '2023-03-31'
var tags = {
  owner: 'team-data-insight'
  environment: 'test'
  confidentiality: 'internal'
  'personal-data': 'no'
  'last-review': utcDate
}

resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'rg-anineharto-sandbox'
  location: location
  tags: tags
}

