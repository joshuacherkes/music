class AddEnvToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :env, :string
  end
end
