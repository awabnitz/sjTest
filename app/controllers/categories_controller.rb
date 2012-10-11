class CategoriesController < ApplicationController
  def index



  end
  def show
    category_id = params[:id]
    #@categories = Category.all(:conditions =>["id = ?",category_id])
    @categorizations = Categorization.where("category_id = ?", category_id)
    @post_ids = @categorizations.all(:select => :post_id).collect{|u|u.post_id.to_s}
    @posts = Post.paginate(:per_page => 8, :page => params[:page], :order =>"created_at DESC",:conditions => ["id IN (?)", @post_ids ])
    @tags = Category.all
    @url = url_for(:only_path => true )
    @active = @url.gsub(/\/categories\//, "")
    @number = @active.to_f

  end
end
