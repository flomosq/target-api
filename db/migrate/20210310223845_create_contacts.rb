class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :message, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
