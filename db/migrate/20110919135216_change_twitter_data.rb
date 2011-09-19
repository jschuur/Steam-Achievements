class ChangeTwitterData < ActiveRecord::Migration
  def change
    add_column :users, :twitter_handle, :string
    rename_column :users, :twitter_name, :twitter_real_name
  end
end