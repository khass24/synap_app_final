class RemoveNameFromPeople < ActiveRecord::Migration[5.2]
  def change
    remove_column :people, :name, :string
  end
end
