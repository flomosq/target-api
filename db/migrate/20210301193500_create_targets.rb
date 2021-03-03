class CreateTargets < ActiveRecord::Migration[6.1]
  def change
    create_table :targets do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :topic, null: false, foreign_key: true
      t.string :title, null: false
      t.integer :radius, null: false
      t.decimal :latitude, null: false, precision: 10, scale: 6
      t.decimal :longitude, null: false, precision: 10, scale: 6

      t.timestamps
    end
  end
end
