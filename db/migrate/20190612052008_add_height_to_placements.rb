class AddHeightToPlacements < ActiveRecord::Migration[5.1]
  def change
    add_column :placements, :height, :integer
  end
end
