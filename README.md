# Hashlog（ハッシュログ）

## サービス概要
頑張りを可視化したい面倒くさがりツイッタラーが<br>
ハッシュタグを付けてツイートするだけで記録できる<br>
学習記録管理サービスです。

## 登場人物
- エンドユーザー
  - 自分の記録を残したいTwitterユーザー<br>
- 管理ユーザー（Bot）
  - 設定に応じてユーザーにリプライを送るTwitterアカウント
- 管理者
  - ユーザー情報を管理する人（サービス提供者）

## プロダクト
自分の特定タグのツイートを学習ログとしてまとめるWebアプリケーション

## マーケット
- #今日の積み上げ のようなタグで学習記録をツイートしている駆け出しエンジニア
- 学習を継続したい駆け出しエンジニア系ツイッタラー

## 第一フェーズ
### ユーザーが抱える課題
Twitterを使って学習記録を書いている理由を聞いてみたところ、以下のものがあった。
- 就活で継続力のアピールにするため。
- 後々学習の振り返りをするため。

しかし、日常の呟きもするアカウントでは、どうしてもノイズが混ざってしまう。<br>
単発のツイートではタイムラインに埋もれてしまうため、後々振り返ることが困難になる。

#### 現行の対応策
- リプライをつなげてツリーにすることで学習ツイートのみをまとめる。
- そのアカウントでは勉強以外の内容を呟かない。

### 解決方法
ツイートログを収集しまとめることで、ユーザーはハッシュタグを付けて呟くだけで学習記録を可視化できるようになる。<br>
学習の継続期間と継続率を記録することで、自分の頑張りを実感できる。

#### 学習ツイート記録表示
登録したハッシュタグごとに、学習内容を振り返ることのできるログ形式で表示する。

#### 継続日数 / 継続率表示
始めた日から換算して、何日続いているか日数 / 割合で表示する。<br>
絶対的・相対的な指標が表示されるため、ユーザーにとってわかりやすい。また、継続を維持するモチベーションの向上につながる。

## 第二フェーズ
### ユーザーが抱える課題
第一フェーズの機能は「自分が成したこと」にフォーカスを当てているため、実際に継続できるかどうかは当人のやる気に依存する。<br>
自分一人では、忘れたり飽きたりしてしまい、学習を継続できなくなってしまう。

### 解決方法
リマインダー機能を追加し、学習のうっかり忘れを防止する。また、継続が直感的にわかりやすい草表示を追加することで、自分の学習履歴を「頑張り」として可視化できるようにする。<br>
他ユーザーとの関わることのできる機能を追加し、内発的なやる気を引き出す。

#### 表示形式の追加
学習した日が直感的にわかる草形式の表示を追加する。（GitHubの草のイメージ）<br>
継続することに重きを置くため、ツイート数ではなくツイートしたかどうかを記録する。（継続していくと次第に色が変わっていくパターンの方がわかりやすそう）

#### リマインダーリプライ
◯日に一度はツイートすると設定した場合、超えたときにBotによるリプライでTwitterアカウントに通知することで、学習ツイートをするのを忘れる事態を減少させる。<br>
また、自分にプレッシャーを課すことができる。

#### ランキング
継続率ランキングを追加する。後から始めた人も上位にランクインできる。<br>
ランキングに載りたいという理由によってモチベーションを向上させる。
（日数ランキングについては検討中）

#### 並走者の表示
同じハッシュタグを登録しているページをランダムに表示することで、ユーザー同士で並走している感覚になり、やる気を奮い立たせることができる。

<!--
## 第三フェーズ
### ユーザーが抱える課題
学習のモチベーション向上のため、頑張っている仲間と繋がりたい。実際に同じことを頑張っている人と交流したい。自分と同じ言語などを学習中の人と交流したい。<br>
しかし、ハッシュタグの付いた単発のツイートだけでは判断しかねる。

### 解決法
また、交流についてはTwitterに返す。

#### ユーザープロフィール
プロフィールで学習中の言語を設定することで、ユーザーを検索して他のユーザーの学習を参考にすることができる。

#### フォロー機能
プロフィールページからユーザーのツイッターアカウントを直接フォローできる。
-->