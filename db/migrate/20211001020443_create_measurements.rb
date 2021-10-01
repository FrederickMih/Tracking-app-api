class CreateMeasurements < ActiveRecord::Migration[6.1]
  def change
    create_table :measurements do |t|
      t.string :name
      t.string :image_url

      t.timestamps
    end
    add_index :measurements, :name
    add_index :measurements, :image_url
  end
end
