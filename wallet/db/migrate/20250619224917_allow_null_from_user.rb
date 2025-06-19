class AllowNullFromUser < ActiveRecord::Migration[8.0]
  def change
      change_column_null :transfer_mediators, :from_user_id, true
  end
end
