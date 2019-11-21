class RemoveTitleFromMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :title
  end
end
