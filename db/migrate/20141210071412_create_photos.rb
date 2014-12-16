class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :attachable_id
      t.string :attachable_type
      t.boolean :avatar, :default => false
      t.string :image

      t.timestamps
    end
    add_index :photos, [:attachable_id, :attachable_type]
  end
end
