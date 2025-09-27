# メモアプリ

Sinatraで作成したメモアプリ

## 機能

メモの一覧表示
メモの新規作成
メモの詳細表示
メモの編集
メモの削除

## 必要要件

Ruby
Bundler

## セットアップ手順

### 1. リポジトリをクローン

```
git clone https://github.com/saki53/memo-app.git
# マージ前ならdevelopをクローン
git clone -b develop https://github.com/saki53/memo-app.git
cd memo-app
```

### 2. 必要なGemをインストール

```
bundle install
```

### 3. アプリケーションを起動

```
bundle exec ruby app.rb
```

### 4. ブラウザでアクセス

```
http://localhost:4567
```

アプリケーションを停止する場合は `Ctrl + C`

## 使い方

メモの追加: メモ一覧画面のヘッダーにある「追加」ボタンをクリック
メモの表示: 一覧からメモのタイトルをクリック
メモの編集: 詳細画面で「変更」ボタンをクリック
メモの削除: 詳細画面で「削除」ボタンをクリック

## ファイル構成

```
memo-app/
├── app.rb
├── models/
│   └── memo.rb        # Memoクラス
├── views/
│   ├── layout.erb     # 共通レイアウト
│   ├── index.erb      # 一覧画面
│   ├── new.erb        # 新規作成画面
│   ├── show.erb       # 詳細画面
│   └── edit.erb       # 編集画面
│   └── not_found.erb  # 404画面
├── public/
│   └── style.css      # CSS
├── data/              # JSONデータ保存先
├── Gemfile
├── Gemfile.lock
├── .rubocop.yml
├── .gitignore
└── README.md
```
