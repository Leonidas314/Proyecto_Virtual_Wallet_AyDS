class CreateTransferMediator < ActiveRecord::Migration[8.0]
  def change
    create_table :transfer_mediators do |t|
      t.references :from_account, null: false, foreign_key: { to_table: :accounts }
      t.references :to_account, null: false, foreign_key: { to_table: :accounts }
      t.decimal :amount, precision: 10, scale: 2, default: 0.0, null: false

      t.timestamps
    end
  end
end
