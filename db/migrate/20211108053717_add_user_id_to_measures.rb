class AddUserIdToMeasures < ActiveRecord::Migration[6.1]
  def change
    add_column :measures, :user_id, :bigint
  end
end
