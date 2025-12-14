# dev-env-templates

**.default-npm-packages は、Node.js のバージョン管理ツール（mise や asdf など）で、Node.js をインストールした際に自動的にグローバル npm パッケージを導入するための設定ファイルです**。  

---

# .default-npm-packages とは

## 📌 概要
- **役割**: Node.js を新しくインストールした直後に、よく使う npm パッケージを自動でインストールする仕組み  
- **場所**: `$HOME/.default-npm-packages`  
- **形式**: テキストファイルで、1 行に 1 パッケージ名を記述  

---

## 🛠 使用例

### ファイル作成
```sh
# 例: よく使うパッケージを列挙
echo npm-check-updates >> $HOME/.default-npm-packages
echo yarn >> $HOME/.default-npm-packages
echo typescript >> $HOME/.default-npm-packages
```

### Node.js インストール時の挙動
```sh
mise install node@20
```

➡️ 上記コマンドで Node.js をインストールすると、`.default-npm-packages` に書かれたパッケージが **自動的に npm install -g** される。

---

## 🎯 メリット
- **再現性の確保**: 新しい Node.js バージョンを導入しても、常に同じ環境が整う  
- **効率化**: 毎回 `npm install -g` を手動で実行する手間を省ける  
- **チーム標準化**: チーム全員が同じグローバルパッケージを利用できる  

---

## ⚠️ 注意点
- **対象はグローバルパッケージ**のみ（プロジェクトローカルの `package.json` とは別管理）  
- **ツール依存**: mise や asdf などのバージョン管理ツールでサポートされる機能  
- **更新管理**: `.default-npm-packages` を変更した場合、再インストール時に反映される  

---
