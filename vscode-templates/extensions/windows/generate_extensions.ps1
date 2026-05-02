$extensions = code --list-extensions | Where-Object { $_ -notmatch "WSL:" }

$recommendations = @{
    recommendations = $extensions
}

$recommendations | ConvertTo-Json -Depth 5 | Set-Content "extensions.json"

Write-Output "Generated extensions.json"
