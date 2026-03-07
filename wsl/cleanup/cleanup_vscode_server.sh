#!/bin/bash

echo "=== VS Code Server Cleanup Script (WSL2) ==="

VSCODE_DIR="$HOME/.vscode-server"
REMOTE_WSL_DIR="/mnt/c/Users/$USER/vscode-remote-wsl"

echo "WSL VS Code Server directory: $VSCODE_DIR"
echo "Windows vscode-remote-wsl directory: $REMOTE_WSL_DIR"
echo ""

# --- 1. 古い VS Code Server バージョンを削除 ---
if [ -d "$VSCODE_DIR/bin" ]; then
    echo "[1] Removing old VS Code Server versions..."
    cd "$VSCODE_DIR/bin"

    # 最新バージョンを取得
    LATEST=$(ls -t | head -n 1)

    echo "Latest version: $LATEST"
    echo "Removing all except: $LATEST"

    for dir in */; do
        if [ "$dir" != "$LATEST/" ]; then
            echo "Deleting: $dir"
            rm -rf "$dir"
        fi
    done
else
    echo "[1] No VS Code Server bin directory found."
fi

echo ""

# --- 2. 拡張機能の古いキャッシュ削除 ---
if [ -d "$VSCODE_DIR/extensions" ]; then
    echo "[2] Cleaning extension cache..."
    find "$VSCODE_DIR/extensions" -type d -name "*.obsolete" -exec rm -rf {} +
else
    echo "[2] No extensions directory found."
fi

echo ""

# --- 3. Windows 側の vscode-remote-wsl を削除 ---
if [ -d "$REMOTE_WSL_DIR" ]; then
    echo "[3] Removing Windows-side vscode-remote-wsl cache..."
    rm -rf "$REMOTE_WSL_DIR"
else
    echo "[3] No Windows-side vscode-remote-wsl directory found."
fi

echo ""
echo "=== Cleanup Complete! ==="
