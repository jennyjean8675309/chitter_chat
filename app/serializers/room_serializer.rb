class RoomSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :messages
  attribute :users do |room|
    UserSerializer.new(room.users.uniq)
  end
end
