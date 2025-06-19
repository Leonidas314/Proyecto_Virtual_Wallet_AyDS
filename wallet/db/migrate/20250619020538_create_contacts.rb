class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :cvu
      t.timestamps
    end
  end
end
