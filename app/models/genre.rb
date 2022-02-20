class Genre < ApplicationRecord
    
    enum genre: { 登録済ジャンルから選択: 0}#integer型で管理する
    has_many :items
    has_many :sell_items
end
