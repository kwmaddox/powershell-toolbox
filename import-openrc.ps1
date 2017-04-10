Param(
    [Parameter(Mandatory=$true)]
    [string]$path
)
$openrc = Get-Content $path

foreach ($envvar in $openrc | Select-String "export"){
    $envvar = [string]$envvar
    $envvar = $envvar.Replace("export ",'')
    $envvar = $envvar.Split('=')
    "env:$($envvar[0])"
    [System.Environment]::SetEnvironmentVariable($envvar[0],$envvar[1])
}
