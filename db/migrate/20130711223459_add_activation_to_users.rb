class AddActivationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :activation, :string
  end
end
