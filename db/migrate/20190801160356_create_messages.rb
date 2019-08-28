class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :room_id
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
