# Hashlog（ハッシュログ）

![GitHub release (latest by date)](https://img.shields.io/github/v/release/aiandrox/hashlog)
![Rails](https://img.shields.io/badge/Rails-v5.2.4.3-red)
![Vue.js](https://img.shields.io/badge/Vue.js-v2.6.11-brightgreen)
[![CircleCI](https://circleci.com/gh/aiandrox/hashlog.svg?style=shield)](https://circleci.com/gh/aiandrox/hashlog)
[![Coverage Status](https://coveralls.io/repos/github/aiandrox/hashlog/badge.svg?branch=develop)](https://coveralls.io/github/aiandrox/hashlog?branch=develop)

## サービス概要

**ハッシュタグであなたの学びをキチンとする**

面倒くさがりツイッタラーが  
ハッシュタグを登録するだけで継続を可視化できる  
Twitter 連携型 学習記録サービスです。

[プロダクトについて](/Product.md)

## 使用画面と機能紹介

| トップページ                                                         | 利用規約                                                                                             |
| :------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------- |
| <img src="https://i.gyazo.com/3b1ed1fc55683c17d73c9d5c96643673.png"> | <img src="https://i.gyazo.com/a5df36426cae3326b9813cb2afb6eacf.png">                                 |
| 最近登録されたハッシュタグ 3 件と機能の紹介を表示する。              | ユーザー登録/ログイン前に利用規約を表示し、ユーザーが同意した上で Twitter 認証ページへジャンプする。 |

| マイページ                                                                                                                 | ハッシュタグ登録画面                                                                                                        |
| :------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------- |
| <img src="https://i.gyazo.com/bd2b43a7a36d58c52bb49e9dccce47e0.png">                                                       | <img src="https://i.gyazo.com/4374e41c4f1c5cc06d2df89dcbf65c3b.png">                                                        |
| ユーザープロフィールと公開設定のみ編集できる。<br>非公開設定の場合、自分以外によるユーザーページへのアクセスが制限される。 | ハッシュタグを登録することで、自動でツイートを取得する。<br>登録後はサービス側で自動で 1 日ごとにツイートを収集し更新する。 |

| ツイート一覧ページ（マイページ）                                                                 | ツイート一覧ページ（ユーザーページ）                                  |
| :----------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------- |
| <img src="https://i.gyazo.com/30e89befc5afee6f425363b231d00ea2.png">                             | <img src="https://i.gyazo.com/99d91739e9c979287781ac9af848f53e.png">  |
| 該当のハッシュタグのツイートが表示される。<br>カレンダーにはツイートした日にマークが付いている。 | 限定公開/非公開設定にしたハッシュタグはユーザーページに表示されない。 |

| ハッシュタグの設定                                                                                                                    | 日付選択時                                                           |
| :------------------------------------------------------------------------------------------------------------------------------------ | :------------------------------------------------------------------- |
| <img src="https://i.gyazo.com/06af34d7b35b912ddb6c95765fc8fd23.png">                                                                  | <img src="https://i.gyazo.com/aa81ebd3412dfd89508b545767924fb1.png"> |
| 公開設定・リマインダーを設定する。<br>リマインダーで設定した日数ツイートがない場合、Bot から Twitter アカウントにリプライが送られる。 | カレンダーの日付を選択することで、その日のツイートだけを表示する。   |

## 使用技術

### バックエンド

- Ruby 2.6.6
- Ruby on Rails 5.2.4.3
- RSpec
- Twitter API（外部 API）

#### 機能における主要な Gem

- sorcery（ログイン）
- twitter（TwitterAPI OAuth）
- pagy（ページネーション）
- banken（認可）
- whenever（定期実行）
- sidekiq（非同期処理）
- administrate（管理画面）

#### ER 図

[ER 図](https://drive.google.com/file/d/1xGTZvsnf1Tqezl44daZW8v8j_zwY8kEK/view?usp=sharing)

### フロントエンド

- Vue.js 2.6.11
- axios 0.19.2
- Vuex 3.1.3
- Vee-Validate 3.3.0
- Vuetify 2.2.21

### インフラストラクチャー

- CircleCI
- AWS
  - VPC
  - EC2
    - Amazon Linux 2
  - RDS
    - MySQL 8.0.19

#### インフラ構成

（画像）

## 環境構築手順

```shell
$ rbenv local 2.6.6
$ nodenv local 14.2.0
$ bundle install --path vendor/bundle
$ yarn install
$ rails db:create
$ rails db:migrate
$ rake db:seed_fu
```

### サーバー起動

```shell
$ redis-server
$ bundle exec sidekiq
$ rails server
$ bin/webpack-dev-server
```

上記のコマンドは`$ foreman start`で代替可能。

### テスト実行

```shell
$ bundle exec rspec spec
```

### 開発者用 自動ログイン

See `app/controllers/development/sessions_controller.rb`

```
/login_as/[user_id]
```
