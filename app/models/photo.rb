class Photo < ActiveRecord::Base
   belongs_to :post
  # belongs_to :zone
  #has_one :content, as: :positionable
  #belongs_to :post

  attr_accessible :order_id, :image, :post_id, :id
  has_attached_file :image, :styles => {:thumb=>   "250x250", :medium  => "150x150>" }

end
