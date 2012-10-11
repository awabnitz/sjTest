class Contentzone < ActiveRecord::Base
  belongs_to :post
  #belongs_to :zone
  #belongs_to :post
  #has_one :content, as: :positionable
  attr_accessible :paragraph, :post_id, :order_id, :id
end
