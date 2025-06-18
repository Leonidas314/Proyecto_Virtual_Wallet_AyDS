class CreateTransferMediators < ActiveRecord::Migration[8.0]
  def change
    create_table :transfer_mediators do |t|
      t.references :from_user, null: false, foreign_key: { to_table: :users }
      t.references :to_user, null: false, foreign_key: { to_table: :users }
      t.decimal :amount, null: false, precision: 15, scale: 2

      t.timestamps
    end
  end
end
