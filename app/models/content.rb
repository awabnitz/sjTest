class Content < ActiveRecord::Base
  #belongs_to :positionable, :polymorphic => true
  belongs_to :photo
  belongs_to :contentzone
  belongs_to :post
  attr_accessible :content_id, :content_type, :order, :post_id
end
