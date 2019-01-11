class CreatePromos < ActiveRecord::Migration[5.2]
  def change
    create_table :promos do |t|
      t.references :user
      t.string :promo_title
      t.text :promo_text

      t.timestamps
    end
  end
end
