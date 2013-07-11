class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :token
      t.boolean :admin

      t.timestamps
    end

    add_column :notes, :user_id, :integer
  end
end
