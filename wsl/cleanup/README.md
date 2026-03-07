# cleanup_vscode_server.sh

## 以下の不要なキャッシュを削除する
- wsl2を利用していると不要なキャッシュが増え続けるため、不要なキャッシュを削除
  - VSCODE_DIR
    - "$HOME/.vscode-server"
  - REMOTE_WSL_DIR
    - /mnt/c/Users/$USER/vscode-remote-wsl
