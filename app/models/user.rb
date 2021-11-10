class User < ApplicationRecord
  has_many :measures, dependent: :destroy
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { in: 4..8 }
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  
  
  has_secure_password

end
