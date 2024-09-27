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
|birth_year        |integer|null: false    |
|birth_month       |integer|null: false    |
|barth_day         |integer|null: false    |

### Association
* has_many :histories  
* has_many :items  
  
## items

|Column            |Type      |Options                      |
|------------------|----------|-----------------------------|
|item              |string    |null: false                  |
|item_comment      |text      |null: false                  |
|category          |string    |null: false                  |
|item_status       |string    |null: false                  |
|shipping_fee      |string    |null: false                  |
|ship_from         |string    |null: false                  |
|shipping_time     |string    |null: false                  |
|price             |integer   |null: false                  |
|user_id           |references|null: false,foreign_key: true|
※商品画像はActiveStorageを使用の為未記入。

### Association
* belongs_to :user  
* belongs_to :sipping
* has_one :history  
  
## shippings

|Column            |Type   |Options                      |
|------------------|-------|-----------------------------|
|postal_code       |integer|null: false                  |
|prefectures       |text   |null: false                  |
|address           |text   |null: false                  |
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
* has_many :users