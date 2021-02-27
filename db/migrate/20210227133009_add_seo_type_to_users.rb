class AddSeoTypeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :seo_type, :string
  end
end
