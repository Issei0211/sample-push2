class ChangeEntryRoomId < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :roon_id, :integer
    add_column :entries, :room_id, :integer
  end
end
