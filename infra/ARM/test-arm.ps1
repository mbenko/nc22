
## LOGIN TO AZURE
az login
az account show

## Set Vars
$appName = "nc22"
$env = "arm"
$rg = "$appName-$env-rg"
$today = Get-Date -Format 'MMddyy-hhmm'
$deploymentName = "arm-cli-$today"
$templateFile = ".\myWebSite.json"
$paramFile    = ".\MyWebSite.parameters.json"

## Deploy RG and ARM Template
az group create --name $rg --location centralus

az deployment group create --name $deploymentName --resource-group $rg --template-file $templateFile --parameters $paramFile


## Decompile Bicep File from source ARM
az bicep decompile -f .\MyWebSite.json
