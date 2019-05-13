class CreatePlacements < ActiveRecord::Migration[5.1]
  def change
    create_table :placements do |t|
      t.integer :position_x
      t.integer :position_y
      t.integer :ad_id
      t.integer :episode_id
      t.integer :created_by
      t.integer :timestamp_start
      t.integer :timestamp_end

      t.timestamps
    end
  end
end
