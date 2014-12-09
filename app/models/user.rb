class User < ActiveRecord::Base
  belongs_to :organization

  has_and_belongs_to_many :occupations

  has_secure_password

end
