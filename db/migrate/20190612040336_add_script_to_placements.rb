class AddScriptToPlacements < ActiveRecord::Migration[5.1]
  def change
    add_column :placements, :script, :string
  end
end
