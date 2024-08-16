class RemoveTiitleFromPrototypes < ActiveRecord::Migration[7.0]
  def change
    remove_column :prototypes, :tiitle, :string
  end
end
