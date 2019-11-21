class RoomSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :messages
  attribute :users do |room|
    room.users.uniq
  end
end
