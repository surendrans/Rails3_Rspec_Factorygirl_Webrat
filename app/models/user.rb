class User < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :name, :within => 3..10
#  has_many :posts
end
