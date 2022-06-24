# Input Parameters & Variables
param([string]$token = '', [string]$branch = 'main')
$url='https://api.github.com/repos/neudesic/documentation-integreation-apis/actions/workflows/cd-wiki.yml/dispatches'

# Headers
$headers = @{
    Authorization = 'token ' + ${token}
    Accept = 'application/vnd.github.v3+json'
}

# Body
$body = @"
{
    "ref":"$branch"
}
"@

# Parameters
$params = @{
    Uri         = $url
    Headers     = $headers
    Method      = 'POST'
    Body        = $body
    ContentType = 'application/json'
}

# Invoke REST API
Write-Output "Sending Rest API: $url"
Invoke-WebRequest @params
Write-Output "Sent Rest API: $url"