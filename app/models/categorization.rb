class Categorization < ActiveRecord::Base
  belongs_to :post
  belongs_to :category
  attr_accessible :post_id, :category_id, :created_at, :position

end
