class Post < ActiveRecord::Base
	include Bootsy::Container
  belongs_to :user
	belongs_to :cat
	default_scope -> { order(created_at: :desc) }
	has_many :comments, :through => :users
	validates :content,presence: true, length: { maximum: 300 }
	validates :title,presence: true, length: { maximum: 50 }
	validates :cat_id,presence: true



def self.search(search, designation)
    search_condition = "%" + search + "%"
    where("#{designation} LIKE ?", "%#{search}%")
  end
end
