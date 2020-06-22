class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email
  has_many :blessings
  has_many :comments
end
