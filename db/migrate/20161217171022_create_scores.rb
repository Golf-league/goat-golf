class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|

      t.references :user, index: true
      t.string :course
      t.datetime :date
      t.integer :handicap
      t.integer :stableford
      t.integer :strokes
      t.timestamps
    end
  end
end
