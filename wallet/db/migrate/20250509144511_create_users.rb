class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :cvu
      t.string :phone
      t.integer :balance, default: 0
      t.string :password_digest      
      t.timestamps
    end
  end
end