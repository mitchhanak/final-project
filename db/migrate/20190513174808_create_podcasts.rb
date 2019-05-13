class CreatePodcasts < ActiveRecord::Migration[5.1]
  def change
    create_table :podcasts do |t|
      t.integer :created_by
      t.string :logo
      t.string :title

      t.timestamps
    end
  end
end
