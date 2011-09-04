class AdminController < ApplicationController

  before_filter :check_credentials, :except => [:login]

  def check_credentials
    redirect_to(:action => :login) if User.current.nil?
  end

  def login
    render :text => "Login form should be here"
  end

  def index
  end

end
