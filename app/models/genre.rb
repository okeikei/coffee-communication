class Genre < ApplicationRecord
    
    enum genre: { 登録済ジャンルから選択: 0}#integer型で管理する
    belongs_to :item
end
