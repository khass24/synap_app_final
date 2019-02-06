class RenameNameInOrganizations < ActiveRecord::Migration[5.2]
  def change
    rename_column :organizations, :name, :organization
  end
end
