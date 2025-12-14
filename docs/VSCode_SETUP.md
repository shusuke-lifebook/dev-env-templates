# VSCode 開発環境セットアップガイド

このドキュメントは、チームで利用する VSCode 設定ファイルの管理方法をまとめたものです。
開発言語ごとの設定ファイルと、共通の拡張機能定義を Git 管理し、プロジェクトで再利用できるようにします。

---

## 📂 ファイル構成

- `settings.<言語>.jsonc`
  - 各開発言語専用の VSCode 設定ファイル
  - コメント付き JSONC 形式で管理し、可読性を高める
  - 例:
    - `settings.python.jsonc`
    - `settings.ruby.jsonc`
    - `settings.go.jsonc`

- `extensions.json`
  - チームで推奨する VSCode 拡張機能を定義
  - 開発言語ごとには分けず、共通ファイルとして管理

---

## 🛠 プロジェクトでの利用方法

### 1. 言語別設定ファイルの適用
プロジェクト開始時に、必要な言語の設定ファイルをコピーして利用します。

```bash
cp vscode-templates/settings.python.jsonc .vscode/settings.json
```

### 2. 拡張機能の適用
共通の拡張機能定義を .vscode/extensions.json としてコピーします。

```bash
cp vscode-templates/extensions.json .vscode/extensions.json
```
