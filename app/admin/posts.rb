ActiveAdmin.register Post, :html =>{ :multipart => true} do
  actions :all, :except => [:destroy]
  index do
    column :active
    column :title
    column :author
    column :created_at
    column :updated_at

    column "categories" do |post|
      post.categories.map{|p| (p.name) }
    end
    column "avatar" do |event|
      link_to(image_tag(event.avatar.url(:thumb), :height => '100'), admin_post_path(event))
    end




  end
  form do |f|
    f.inputs do
      f.input :active, :as => :select
      f.input :author, :collection => Author.all.map{ |author| [author.name, author.id] }
      f.input :categories, as: :check_boxes
      f.input :title
      f.input :subhead
      f.input :content, :label => "Pre Video Content"


      f.has_many :contentzones, :name => "Text Areas" do |t|
        t.inputs "paragraph" do
          t.input :paragraph, :label => "text"
          t.input :order_id, :label => "order"

          #repeat as necessary for all fields
        end
      end


      f.has_many :photos, :name => "Images" do |r|
        r.inputs "image" do
          r.input :image, :as => :file
          r.input :order_id, :label => "order"

          #repeat as necessary for all fields
        end

      end
      f.input :video_url
      f.input :avatar, :as => :file

    end
    f.buttons
  end



end
