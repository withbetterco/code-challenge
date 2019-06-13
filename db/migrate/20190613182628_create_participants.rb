class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.string :email
      t.string :f_name
      t.string :l_name
      t.integer :gender, null: false, default: 0
      t.string :phone
      t.integer :zip
      t.integer :current_weight
      t.integer :height

      t.timestamps
    end
  end
end
