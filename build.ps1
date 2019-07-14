param([String]$currentValuesPath, [int]$changeInterval)

trap{
    write-output "TRAPEPD!"
    write-output $_
    exit 1
}

Function Get-Current-Values{
    param($currentValuesPath)

    $csvCurrentValues=Get-Content -Path $currentValuesPath | out-string
    $currentValues=$csvCurrentValues.replace("`n",",").replace("`r","").TrimEnd(',')

    return $currentValues
} 

Write-Host "Building automatic current control $currentValuesPath $changeInterval" -ForegroundColor Green
$global:ErrorActionPreference="Stop"

$rootDirectory=$PSScriptRoot
$sourceDirectory="$rootDirectory\src"
$deploymentDirectory="$rootDirectory\deployment"

Write-Host "Cleaning build artifacts" -ForegroundColor Green
Remove-Item $deploymentDirectory -Force -Recurse -ErrorAction Continue

New-Item -Path $deploymentDirectory -ItemType Directory -Force -ErrorAction Continue | Out-Null
Write-Host "Finished cleaning build artifacts" -ForegroundColor Green

$currentValues=Get-Current-Values $currentValuesPath
Write-Host "Values read from csv:$currentValues"
Copy-Item "$sourceDirectory\automaticCurrentControl.template.ino" "$deploymentDirectory\automaticCurrentControl.ino" -Force

(Get-Content "$deploymentDirectory\automaticCurrentControl.ino").replace('{{CurrentValues}}', "{$currentValues}").replace('{{intervalInSeconds}}',"$changeInterval") | Set-Content "$deploymentDirectory\automaticCurrentControl.ino"
Write-Host "Finished replacing placeholders" -ForegroundColor Green

Write-Host "Build script finished"