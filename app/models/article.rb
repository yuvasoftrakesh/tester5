class Article < ApplicationRecord
	has_one_attached :avatar
	has_many :likes, dependent: :destroy 
	validates :title, presence: true
	validates :description, presence: true
end
