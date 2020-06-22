class User < ApplicationRecord
  has_many :blessings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true

  has_secure_password
end
