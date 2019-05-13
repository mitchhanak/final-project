class CreateEpisodes < ActiveRecord::Migration[5.1]
  def change
    create_table :episodes do |t|
      t.integer :created_by
      t.string :title
      t.integer :podcast_id
      t.string :audio
      t.string :xml
      t.text :description

      t.timestamps
    end
  end
end
