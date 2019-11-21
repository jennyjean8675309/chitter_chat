class MessageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :room_id, :content
  attribute :author do |message|
    user = User.all.find{ |user| user.id == message.user_id }
    UserSerializer.new(user)
  end
end
