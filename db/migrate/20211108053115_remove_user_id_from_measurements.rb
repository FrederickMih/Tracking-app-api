class RemoveUserIdFromMeasurements < ActiveRecord::Migration[6.1]
  def change
    remove_column :measurements, :user_id, :bigint
  end
end
