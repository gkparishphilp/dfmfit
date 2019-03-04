class Contacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.references :user
      t.string :name
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
