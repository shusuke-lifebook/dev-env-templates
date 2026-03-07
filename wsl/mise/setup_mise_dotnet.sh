#!/bin/bash

echo "=== mise dotnet setup for VS Code + C# Dev Kit ==="

# 1. mise の初期化を VS Code Server に確実に読み込ませる
echo "[1] Ensuring mise activate is loaded in non-login shells..."
if ! grep -q 'mise activate bash' ~/.bashrc; then
    echo 'eval "$(mise activate bash)"' >> ~/.bashrc
    echo "Added mise activate to ~/.bashrc"
else
    echo "mise activate already present in ~/.bashrc"
fi

# 2. DOTNET_ROOT を設定
DOTNET_PATH=$(mise where dotnet 2>/dev/null)

if [ -z "$DOTNET_PATH" ]; then
    echo "ERROR: mise dotnet not found. Run: mise install dotnet"
    exit 1
fi

echo "[2] Setting DOTNET_ROOT to: $DOTNET_PATH"

if ! grep -q "export DOTNET_ROOT=" ~/.bashrc; then
    echo "export DOTNET_ROOT=\"$DOTNET_PATH\"" >> ~/.bashrc
else
    sed -i "s|export DOTNET_ROOT=.*|export DOTNET_ROOT=\"$DOTNET_PATH\"|" ~/.bashrc
fi

# 3. DOTNET_ROOT_x86 も設定（C# Dev Kit が参照することがある）
echo "[3] Setting DOTNET_ROOT_x86..."
if ! grep -q "export DOTNET_ROOT_x86=" ~/.bashrc; then
    echo "export DOTNET_ROOT_x86=\"$DOTNET_PATH\"" >> ~/.bashrc
else
    sed -i "s|export DOTNET_ROOT_x86=.*|export DOTNET_ROOT_x86=\"$DOTNET_PATH\"|" ~/.bashrc
fi

# 4. PATH に mise shims を確実に追加
echo "[4] Ensuring mise shims are in PATH..."
if ! grep -q "$HOME/.local/share/mise/shims" ~/.bashrc; then
    echo "export PATH=\"$HOME/.local/share/mise/shims:\$PATH\"" >> ~/.bashrc
fi

# 5. VS Code Server のキャッシュを削除（再構築させる）
echo "[5] Removing VS Code Server cache..."
rm -rf ~/.vscode-server

echo ""
echo "=== Setup Complete ==="
echo "Please restart your WSL session:"
echo "  exit"
echo "  wsl --shutdown"
echo "Then reopen VS Code."
