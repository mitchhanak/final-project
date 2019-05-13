class CreateAdPermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :ad_permissions do |t|
      t.integer :ad_id
      t.integer :podcast_id

      t.timestamps
    end
  end
end
