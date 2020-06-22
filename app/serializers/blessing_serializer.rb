class BlessingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :location, :kind, :image, :id, :user_id, :updated_at
  has_many :comments
  has_many :likes
  belongs_to :user
end
