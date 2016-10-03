# README

## Usage

```
$ vagrant up
$ vagrant ssh
$ cd /vagrant/nakanichi

# then initial boot
$ bundle install

# rails app 起動
$ bundle exec rails s -b 0.0.0.0
```

## フロントエンド開発時

```
# 最新の依存関係を解決したいとき
$ npm install

# 開発時のビルドコマンド（ソースマップの生成）
$ npm run build

# リモートプッシュする前のビルドコマンド（難読化＆ミニファイ）
$ npm run prod
```