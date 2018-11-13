class CreateWaivers < ActiveRecord::Migration[5.2]
  def change
    create_table :waivers do |t|
      t.references :user 
      t.string :name
      t.date :dob
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :email
      t.string :emergency_contact_name
      t.string :emergency_contact_phone
      t.boolean :heart_condition
      t.boolean :chest_pain_doing_activity
      t.boolean :chest_pain_without_doing_activity
      t.boolean :lose_balance
      t.boolean :bone_problem
      t.boolean :prescription_drugs
      t.boolean :other_reason_not_to_do_activity
      t.string :signature
      t.date :sign_date
      t.string :legal_guardian_name
      t.string :legal_guardian_signature
      t.date :legal_guardian_sign_date
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
