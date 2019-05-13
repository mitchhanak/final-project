class CreateAds < ActiveRecord::Migration[5.1]
  def change
    create_table :ads do |t|
      t.integer :created_by
      t.string :name
      t.integer :width
      t.integer :height
      t.string :image
      t.string :target_url

      t.timestamps
    end
  end
end
