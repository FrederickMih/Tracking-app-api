class CreateMeasurements < ActiveRecord::Migration[6.1]
  def change
    create_table :measurements do |t|
      t.string :measurement_name

      t.timestamps
    end
    add_index :measurements, :measurement_name
  end
end
