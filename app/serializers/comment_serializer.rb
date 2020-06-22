class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :blessing_id, :user_id
end
