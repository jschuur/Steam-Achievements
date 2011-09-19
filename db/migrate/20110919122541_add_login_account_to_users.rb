class AddLoginAccountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login_account, :boolean, :default => false
  end
end