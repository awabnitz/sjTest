class PostsController < ApplicationController
  def index

        # @posts = Post.all(:order => "created_at DESC")
    @posts = Post.paginate(:per_page => 7, :page => params[:page], :order =>"created_at DESC")
    #@author_posts = @posts.authors.paginate(:per_page => 7, :page => params[:page], :order =>"created_at DESC")
    @tags = Category.all

  end

  def first

  end

  def show
    @post = Post.find(params[:id])

    @video_url = @post.video_url
    @vimeo = @video_url.gsub(/http:\/\/vimeo.com\//, "")
    @url = url_for(:only_path => false )
    @sub_title = @post.title.gsub(/ /, "%26s+")
    @encoded = @url.gsub(/\//, "%2F")
    @encoded_url = @encoded.gsub(/:/, "%3A")
    @facebook_add =  Post.update_counters(@post.id, :facebook => 1)
    @text_facebook =  "http://www.facebook.com/sharer/sharer.php?u="
    post_id = params[:id]
    categorizations = Categorization.where("post_id = ?", post_id)
    category_ids = categorizations.all(:select => :category_id).collect{|u|u.category_id.to_s}
    @tags = Category.all(:conditions =>["id IN (?)", category_ids])
    @content = Contentzone.where("post_id IN (?)", post_id)
    @photo = Photo.where("post_id IN (?)", post_id)
    @combined = @photo + @content
    @contents = (@photo + @content).sort_by(&:order_id)

  end
  def create
    @post = Post.create( params[:post] )
  end




end

#class Content_layout < struct.new(:order_id, :main); end
