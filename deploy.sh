# *nix only
export RG="reddog-mich2025"
export LOCATION="eastus"
export SUB_ID="ac9decd5-c5b4-40dd-b637-1b0294837f8f"

# Follow Azure CLI prompts to authenticate to your subscription of choice
az login
az account set --subscription $SUB_ID

# Create resource group
az group create -n $RG -l $LOCATION

# Deploy all infrastructure and reddog apps
az deployment group create -n reddog -g $RG -f ./deploy/bicep/main.bicep

# Show outputs for bicep deployment
az deployment group show -n reddog -g $RG -o json --query properties.outputs.urls.value
