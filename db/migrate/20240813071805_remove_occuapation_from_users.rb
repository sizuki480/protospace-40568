class RemoveOccuapationFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :occuapation, :text
  end
end
