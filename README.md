## users
  
|Column            |Type   |Options        |
|------------------|-------|---------------|
|nickname          |string |null: false    |
|email             |string |null: false    |
|password          |string |null: false    |
|encrypted_password|string |null: false    |
|first_name        |string |null: false    |
|last_name         |string |null: false    |
|first_name_kana   |string |null: false    |
|last_name_kana    |string |null: false    |
|birthday          |date   |null: false    |
  
### Association
* has_many :histories  
* has_many :items  
  
## items
  
|Column               |Type      |Options                      |
|---------------------|----------|-----------------------------|
|item                 |string    |null: false                  |
|item_comment         |text      |null: false                  |
|category_id          |integer   |null: false                  |
|item_status_id       |integer   |null: false                  |
|shipping_fee_id      |integer   |null: false                  |
|ship_from_id         |integer   |null: false                  |
|shipping_time_id     |integer   |null: false                  |
|price                |integer   |null: false                  |
|user_id              |references|null: false,foreign_key: true|
※商品画像はActiveStorageを使用の為未記入。
※user_id以外の〇〇_idカラムはActiveHashを使用。  
  
### Association
* belongs_to :user  
* belongs_to :sipping  
* has_one :history  
* belongs_to :category  
* belongs_to :item_status  
* belongs_to :shipping_fee  
* belongs_to :ship_from  
* belongs_to :shipping_time  
  
## shippings
  
|Column            |Type   |Options                      |
|------------------|-------|-----------------------------|
|postal_code       |integer|null: false                  |
|prefectures       |text   |null: false                  |
|address           |string |null: false                  |
|house_num         |string |null: false                  |
|building_name     |string |                             |
|phone_num         |integer|null: false                  |

### Association
* has_many :items  
  
## histories
  
|Column            |Type      |Options                      |
|------------------|----------|-----------------------------|
|item_id           |references|null: false,foreign_key: true|
|user_id           |references|null: false,foreign_key: true|

### Association
* belongs_to :item  
* has_one :user  
  
## category(ActiveHash)  
  
|id|name                    |
|--|------------------------|
| 1|"---"                   |
| 2|"レディース"             |
| 3|"メンズ"                 |
| 4|"ベビー・キッズ"         |
| 5|"インテリア・住まい・小物"|
| 6|"本・音楽・ゲーム"        |
| 7|"おもちゃ・ホビー・グッズ" |
| 8|"家電・スマホ・カメラ"    |
| 9|"スポーツ・レジャー"      |
|10|"ハンドメイド"           |
|11|"その他"                 |
  
### Association  
* has_many :items  
  
## item_status(ActiveHash)  
  
|id|name                    |
|--|------------------------|
| 1|"---"                   |
| 2|"新品・未使用"           |
| 3|"未使用に近い"           |
| 4|"目立った傷や汚れなし"    |
| 5|"やや傷や汚れあり"        |
| 6|"傷や汚れあり"           |
| 7|"全体的に状態が悪い"      |
  
### Association  
* has_many :items  
  
## shipping_fee(ActiveHash)  
  
|id|name                    |
|--|------------------------|
| 1|"---"                   |
| 2|"着払い(購入者負担)"      |
| 3|"送料込み(出品者負担)"    |
  
### Association  
* has_many :items  
  
## ship_from(ActiveHash)  
  
|id|name        |
|--|------------|
| 1|"---"       |
| 2| "北海道"   |
| 3| "青森県"   |
| 4| "岩手県"   |
| 5| "宮城県"   |
| 6| "秋田県"   |
| 7| "山形県"   |
| 8| "福島県"   |
| 9| "茨城県"   |
|10| "栃木県"   |
|11| "群馬県"   |
|12| "埼玉県"   |
|13| "千葉県"   |
|14| "東京都"   |
|15| "神奈川県" |
|16| "新潟県"   |
|17| "富山県"   |
|18| "石川県"   |
|19| "福井県"   |
|20| "山梨県"   |
|21| "長野県"   |
|22| "岐阜県"   |
|23| "静岡県"   |
|24| "愛知県"   |
|25| "三重県"   |
|26| "滋賀県"   |
|27| "京都府"   |
|28| "大阪府"   |
|29| "兵庫県"   |
|30| "奈良県"   |
|31| "和歌山県" |
|32| "鳥取県"   |
|33| "島根県"   |
|34| "岡山県"   |
|35| "広島県"   |
|36| "山口県"   |
|37| "徳島県"   |
|38| "香川県"   |
|39| "愛媛県"   |
|40| "高知県"   |
|41| "福岡県"   |
|42| "佐賀県"   |
|43| "長崎県"   |
|44| "熊本県"   |
|45| "大分県"   |
|46| "宮崎県"   |
|47| "鹿児島県" |
|48| "沖縄県"   |  
  
### Association  
* has_many :items  
  
## shipping_time(ActiveHash)  
  
|id|name                    |
|--|------------------------|
| 1|"---"                   |
| 2|"1~2日で発送"            |
| 3|"2~3日で発送"            |
| 4|"4~7日で発送"            |
  
### Association  
* has_many :items  
  