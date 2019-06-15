class AddStatusToParticipants < ActiveRecord::Migration[5.2]
  def change
    add_column :participants, :status, :integer, default: 0

    add_index :participants, :status
  end
end
