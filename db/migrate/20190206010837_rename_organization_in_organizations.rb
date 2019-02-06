class RenameOrganizationInOrganizations < ActiveRecord::Migration[5.2]
  def change
    rename_column :organizations, :organization, :organization_name
  end
end
