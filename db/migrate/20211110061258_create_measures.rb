class CreateMeasures < ActiveRecord::Migration[6.1]
  def change
    create_table :measures do |t|
      t.integer :user_id
      t.integer :measurement_id
      t.float :data

      t.timestamps
    end
    add_index :measures, :data
  end
end
