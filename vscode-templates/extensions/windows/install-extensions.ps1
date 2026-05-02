# install-extensions.ps1
# extensions.json に記載された拡張機能を一括インストール

$extensions = (Get-Content .vscode/extensions.json | ConvertFrom-Json).recommendations

foreach ($ext in $extensions) {
    if ($ext -and $ext -notmatch "WSL:") {
        Write-Output "Installing $ext ..."
        code --install-extension $ext
    }
}
