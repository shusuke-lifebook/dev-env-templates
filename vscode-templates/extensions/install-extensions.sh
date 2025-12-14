#!/bin/bash
# install-extensions.sh
# extensions.json に記載された拡張機能を一括インストール

jq -r '.recommendations[]' .vscode/extensions.json | while read extension; do
  code --install-extension "$extension"
done
