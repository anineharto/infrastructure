locals {
  azurerm_tags = {
    "owner" : "team-data-insight",
    "environment" : "prod",
    "confidentiality" : "internal",
    "personal-data" : "no",
    "last-review" : "2023-05-25",
  }
  resource_group_name = "rg-anineharto-sandbox"
}