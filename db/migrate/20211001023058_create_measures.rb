class CreateMeasures < ActiveRecord::Migration[6.1]
  def change
    create_table :measures do |t|
      t.float :value
      t.references :measurement, null: false, foreign_key: true

      t.timestamps
    end
    add_index :measures, :value
  end
end
