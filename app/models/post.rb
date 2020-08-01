class Post < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true
	validates :summary, presence: true
	belongs_to :user
	scope :active, -> {where(active: true)}
	scope :order_by_latest_first, ->{order(created_at: :desc)}
	def details
		"This Post was created on #{created_at.strftime("%d/%m/%Y")}"
	end
	def self.total
		count
	end
end
