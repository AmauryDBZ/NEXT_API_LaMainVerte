class AddDefaultAvatarToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :avatar_url, "https://images.unsplash.com/photo-1485955900006-10f4d324d411?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1952&q=80"
  end
end
