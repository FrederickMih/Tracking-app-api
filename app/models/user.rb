class User < ApplicationRecord
  has_secure_password
  has_many :measurements, foreign_key: :user_id, dependent: :destroy

  validates_presence_of :username, :email, :password_digest
  validates_uniqueness_of :email, :username
  validates :password, length: { in: 4..10 }
end
