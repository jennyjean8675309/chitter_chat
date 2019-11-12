class AddDescriptionToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :description, :string
  end
end
