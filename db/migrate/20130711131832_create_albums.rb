class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.date :release
      t.integer :band_id

      t.timestamps
    end

    add_index :albums, :band_id
  end
end
