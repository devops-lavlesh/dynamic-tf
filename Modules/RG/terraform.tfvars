rg_names = {
  rg1 = {
    name       = "drone-rg"
    location   = "eastus"
    managedyBy = "terraform"
    tags = {
      Environment = "development"
      Owner       = "lavlesh"
      Project     = "Azure-Infra"
    CostCenter = "CC2025" }
  }
  # rg2 = {
  #   name     = "drone-rg1"
  #   location = "eastus"
  # }
}