class RenameOrganizationPhoneInOrganizations < ActiveRecord::Migration[5.2]
  def change
    rename_column :organizations, :phone, :organization_phone
  end
end
