class AddOpenRoundToScore < ActiveRecord::Migration[5.0]
  def change
    add_column :scores, :open_round, :boolean
  end
end
