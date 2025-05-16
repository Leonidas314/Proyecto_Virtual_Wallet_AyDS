class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.references :user, foreign_key: true
      t.integer :tipo, default: 0, null: false  # 0: cuenta corriente, 1: caja de ahorro
      t.decimal :balance, precision: 10, scale: 2, default: 0.0, null: false
      t.timestamps
    end
  end
end
