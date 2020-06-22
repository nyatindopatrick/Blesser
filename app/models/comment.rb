class Comment < ApplicationRecord
  belongs_to :blessing
  belongs_to :user
end
