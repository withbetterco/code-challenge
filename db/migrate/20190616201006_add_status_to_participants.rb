class AddStatusToParticipants < ActiveRecord::Migration[5.2]
  def change
    change_table :participants do |t|
      t.integer :status, null: false, default: 0
    end
  end
end
