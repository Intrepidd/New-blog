class PostController < ApplicationController

  def index
    if params[:slug]
      @post = Post.find_by_slug(params[:slug]) rescue nil
      if @post
        return
      end
    end
    render_404 and return
  end

end
