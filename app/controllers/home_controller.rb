class HomeController < ApplicationController

  def index
    #get posts
    @page = params[:page].to_i
    @page = 1 if @page < 1
    offset = (@page - 1) * 10
    @posts = Post.find(:all, :order => "created_at DESC", :limit => 10, :offset => offset)
    @pages = Post.count / 11 + 1
    if (@pages <= 0)
      @pages = 1
    end
  end

end
