class Post < ActiveRecord::Base
  extend FriendlyId
  validates_presence_of :title, :content
  belongs_to :user
  friendly_id :title, :use => :slugged
end

