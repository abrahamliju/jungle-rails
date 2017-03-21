class User < ActiveRecord::Base

  has_many :reviews
  has_secure_password

  validates_uniqueness_of :email

end
