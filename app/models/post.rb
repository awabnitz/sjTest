class Post < ActiveRecord::Base

  belongs_to :author

  has_many :contentzones
  has_many :photos
  #has_many :contentzones
  #has_many :photos
  #has_many :contents
  #has_one :zone
  has_many :categorizations
  has_many :categories, :through => :categorizations
  attr_accessible :content, :title, :author, :video_url, :category_ids, :author_id, :categories, :subhead, :avatar, :contentzones_attributes,:image, :images, :photos_attributes, :contents, :contents_attributes, :active
  has_attached_file :avatar, :styles => { :medium => "310x199", :thumb => "100x100>" }
  has_attached_file :images, :styles => { :medium => "310x199", :thumb => "100x100>" }
  accepts_nested_attributes_for :contentzones, :photos
  def previous_post
    self.class.first(:conditions => ["id < ?", id], :order => "id desc")
  end

  def next_post
    self.class.first(:conditions => ["id > ?", id], :order => "id asc")
  end

  def facebook_count
    self.class.update_counters(:id, :facebook => 1)
  end

end
