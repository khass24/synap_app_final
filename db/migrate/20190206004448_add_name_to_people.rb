class AddNameToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :person_name, :string
  end
end
