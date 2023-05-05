class AddLeaderToUsersChapter < ActiveRecord::Migration[7.0]
  def change
    add_column :users_chapters, :leader, :boolean, default: false
  end
end
