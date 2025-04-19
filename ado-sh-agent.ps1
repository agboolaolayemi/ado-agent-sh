# Define variables
$AgentPackageUrl = "https://vstsagentpackage.azureedge.net/agent/3.238.0/vsts-agent-win-x64-3.238.0.zip"
$AgentPackagePath = "$env:TEMP\agent.zip"
$AgentExtractPath = "C:\agent"

# Set Azure DevOps organization URL
$OrganizationUrl = "https://dev.azure.com/<organization>" 

# Set Personal Access Token 
$PAT = ""

# Set agent name
$AgentName = ""

# Set pool name
$PoolName = ""

# Download agent package
Invoke-WebRequest -Uri $AgentPackageUrl -OutFile $AgentPackagePath

# Extract agent package
Expand-Archive -Path $AgentPackagePath -DestinationPath $AgentExtractPath

# Navigate to agent directory
Set-Location -Path $AgentExtractPath

# Run configuration script with parameters
& .\config.cmd --url $OrganizationUrl --token $PAT --pool $PoolName --agent $AgentName --unattended --runAsService --runAsAutoLogon
