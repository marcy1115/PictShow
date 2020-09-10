# アプリケーション名:  PictShow
## アプリケーションの概要
* 画像(イラスト)を投稿でき、画像(イラスト)をユーザーと共有出来る。
***
## URL
* https://pict-show.herokuapp.com/
*** 
## テスト用アカウント
* E-MAIL: test@test.com
* PASSWORD: 1234567a
***
## 利用方法
① ブラウザ右上のユーザーネームをクリックし、プルダウンメニューを出す。<br>
② プルダウンメニューから'新規投稿'をクリックする。<br>
③ 新規投稿ページの各項目を入力して、'投稿する'をクリックする。<br>
④ 画像が投稿され、トップページに表示される。
***
## 目指した課題解決
* 各ユーザーがイラストを共有できるアプリケーションを作成しました。
***
## 洗い出した要件
* 画像を投稿できる様にする。
***
## 実装予定の機能
* コメント投稿機能実装
* マイページ機能実装
* 検索機能実装
***
## データベース設計
*ER図<br>
![](https://gyazo.com/774abb641fd57225e3b6f20ce38cccf9)
***
***
***
# テーブル設計

## Users テーブル
| column       | type    | options     |
|--------------|---------|-------------|
| email        | string  | null: false |
| passeword    | string  | null: false |
| nickname     | string  | null: false |
| sexuality_id | integer | null: false |
| birth        | date    | null: false |
|
* <font color="Red">email</font>と<font color="Red">password</font>は<font color="Orange">gem 'devise'</font>を使用。

### Association
* has_many: arts
* has_one: plofiles
***

## Arts テーブル
| column       | type       | options                        |
|--------------|------------|--------------------------------|
| user         | references | null: false, foreign_key: true |
| image        | text       | null:false                     |
| title        | string     | null: false                    |
| text         | text       | null: false                    |
| age_limit_id | integer    | null: false                    |
|

### Association
* belongs_to: user
* has_many: comments
***

## Comments テーブル
| column       | type       | options                        |
|--------------|------------|--------------------------------|
| arts         | references | null: false, foreign_key: true |
| image        | text       | null:false                     |
| title        | string     | null: false                    |
| text         | text       | null: false                    |
| age_limit_id | integer    | null: false                    |
|

### Association
* belongs_to: art
***

## Plofiles　テーブル
| column       | type       | options                        |
|--------------|------------|--------------------------------|
| user         | references | null: false, foreign_key: true |
| plof_image   | text       | null:false                     |
| text         | text       | null: false                    |
| my_image:    | text       | null: false                    |
|

### Association
* belongs_to: user
***
