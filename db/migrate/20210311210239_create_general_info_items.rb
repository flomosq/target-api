class CreateGeneralInfoItems < ActiveRecord::Migration[6.1]
  def change
    create_table :general_info_items do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
