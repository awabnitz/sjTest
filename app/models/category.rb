class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :posts, :through => :categorizations
  attr_accessible :name, :post_id, :category_id, :created_at, :position
end
