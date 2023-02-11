class AddIsValidToPolls < ActiveRecord::Migration[7.0]
  def change
    add_column :polls, :is_valid, :boolean
  end
end
