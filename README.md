# README

## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true, index: ture|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, index: ture, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|birth_date|string|null: false|
|zipcode|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_address|string|null: false|
|building_name|string||
|phone_number|string||
|avatar|string||
|description|text||

### Association
- has_many :items
- has_many :item_likes
- has_many :liked_items, through: :item_likes, source: :item
- has_many :comments
- has_many :trades
- has_many :user_reviews
- has_one :credit_card
- belongs_to :prefecture, optional: true


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: ture|
|price|integer|null: false|
|description|text|null: false|
|condition|integer|default: 0, null: false|
|task|integer|default: 0, null: false|
|payer_delivery_expense|integer|default: 0, null: false|
|delivery_days|integer|default: 0, null: false|
|prefecture_id|integer|null: false|
|user|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|size|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :item_images
- belongs_to :category
- belongs_to :size, optional: true
- belongs_to :prefecture
- has_many :item_likes
- has_many :liked_users, through: :items_likes, source: :user
- has_many :comments
- has_one :trade


## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|size|string|null: false|

### Association
- has_many :items


## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## item_likesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|null: false|
|user|references|foreign_key: true|
|commentable_type|string|index: true|
|commentable_id|references|foreign_key: true, index: true|

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :trade


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|index: ture|

### Association
- has_many :items


## tradesテーブル

|Column|Type|Options|
|------|----|-------|
|seller|references|null: false, foreign_key: true|
|buyer|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
|status|integer|null: false|

### Association
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to :item


## user_reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|score|integer|null: false|
|comment|string|null: false|
|user|references|null: false, foreign_key: true|
|trade|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :trade


## deliver_addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|birth_date|string|null: false|
|zipcode|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|house_address|string|null: false|
|building_name|string||
|phone_number|string||

### Association
- belongs_to :user


## sns_credentialsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|uid|string||
|provider|string||

### Association
- belongs_to :user
