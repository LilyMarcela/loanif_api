class CreateTableUsersRole < ActiveRecord::Migration[7.1]
  def change
    create_table :table_users_roles do |t|
      t.string :users
      t.string :roles

      t.timestamps
    end
  end
end
