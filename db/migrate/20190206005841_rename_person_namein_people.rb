class RenamePersonNameinPeople < ActiveRecord::Migration[5.2]
  def change
    rename_column :people, :person_name, :name
  end
end
