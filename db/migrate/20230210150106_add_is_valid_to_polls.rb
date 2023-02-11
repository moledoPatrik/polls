class AddIsValidToPolls < ActiveRecord::Migration[7.0]
  def change
    add_column :polls, :started, :boolean
  end
end
