class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :biz
      t.string :email
      t.string :tel
      t.string :adr
      t.string :cty
      t.string :ste
      t.string :zip
      t.string :web_type
      t.string :hosting_type
      t.string :security_type
      t.string :date_started
      t.string :date_completed
      t.string :order_total
      t.string :ongoing_total
      t.string :due_date
      t.string :domain_name
      t.string :ip_adr

      t.timestamps
    end
  end
end
