class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :steam_id64
      t.string :steam_real_name
      t.string :steam_privacy_state
      t.string :steam_nickname
      t.string :steam_custom_url
      t.string :steam_base_url
      t.string :steam_full_avatar_url
      t.string :steam_medium_avatar_url
      t.string :steam_icon_url

      t.string :twitter_uid
      t.string :twitter_name
      t.string :twitter_token
      t.string :twitter_secret

      t.timestamps
    end
  end
end
