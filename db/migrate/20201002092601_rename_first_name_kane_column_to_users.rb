class RenameFirstNameKaneColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :first_name_kane, :first_name_kana
  end
end
