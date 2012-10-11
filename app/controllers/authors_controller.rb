class AuthorsController < ApplicationController
  def show
    author_id = params[:id]
    @posts = Post.where("author_id = ?", author_id).paginate(:per_page => 8, :page => params[:page], :order =>"created_at DESC")
    @tags = Category.all
    author = Author.where("id = ?", author_id)
    @author_name = author.all( :select => :name).collect { |c| c.name}.to_sentence



  end
end
