class User < ApplicationRecord
  has_many :measurements, foreign_key: :user_id, dependent: :destroy
  
  validates_presence_of :username, :email
  validates_uniqueness_of :email, :username
  validates :password, length: { in: 4..10 }
  
  has_secure_password

  validates_presence_of :password_digest

end
