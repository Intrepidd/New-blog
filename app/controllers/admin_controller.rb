require 'sha1'

class AdminController < ApplicationController

  before_filter :check_credentials, :except => [:login]

  def check_credentials
    redirect_to(:action => :login) if User.current.nil?
  end

  def login
    if User.current
      redirect_to :action => :index and return
    end
    if request.post?
      user = User.where(:username => params[:username]).first rescue nil
      if user
        password = SHA1.new(params[:password]).to_s rescue nil
        if user.password == password #login successfull
          User.current = user
          session[:user_id] = user.id
          redirect_to(:action => :index) and return
        end
      end
      #An error occured
      flash[:error] = "Couple login / mot de passe invalide."
    end
  end

  def index
  end

  def logout
    session[:user_id] = nil
    User.current = nil
    redirect_to :action => :login
  end

end

