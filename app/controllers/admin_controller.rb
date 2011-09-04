class AdminController < ApplicationController

  before_filter :check_credentials, :except => [:login]

  def check_credentials
    redirect_to(:action => :login) if User.current.nil?
  end

  def login
    if request.post?
      user = User.where(:username => params[:username]).first rescue nil
      if user
        password = MD5.new(params[:password]).to_s rescue nil
        if user.password == password #login successfull
          User.current = user
          redirect_to(:action => :index)
        end
      end
      #An error occured
      logger.debug("fail");
      flash[:error] = "Couple login / mot de passe invalide."
    end
  end

  def index
  end

end

