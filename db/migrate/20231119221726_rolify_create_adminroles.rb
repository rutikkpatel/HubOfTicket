class RolifyCreateAdminroles < ActiveRecord::Migration[7.1]
  def change
    create_table(:adminroles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:admin_users_adminroles, :id => false) do |t|
      t.references :admin_user
      t.references :adminrole
    end
    
    add_index(:adminroles, [ :name, :resource_type, :resource_id ])
    add_index(:admin_users_adminroles, [ :admin_user_id, :adminrole_id ])
  end
end
