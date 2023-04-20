class Book < ApplicationRecord
    
  has_one_attached :image
  belongs_to :user
  
  #has_many :post_comments, dependent: :destroy
  #has_many :favorites, dependent: :destroy
  
  #バリデーションの設定
  #validates :title, presence: true
  #validates :body, presence: true
  #validates :image, presence: true
  
end
