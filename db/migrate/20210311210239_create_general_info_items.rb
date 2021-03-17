class CreateGeneralInfoItems < ActiveRecord::Migration[6.1]
  def change
    create_table :general_info_items do |t|
      t.string :name, null: false
      t.text :content, null: false

      t.timestamps
    end

    add_index :general_info_items, :name, unique: true
  end
end
