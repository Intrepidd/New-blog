class User < ActiveRecord::Base

  has_many :posts

  def self.current
    @current_user || nil
  end

  def self.current=(user)
    @current_user = user
  end

end

