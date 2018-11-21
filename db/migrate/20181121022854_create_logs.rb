class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.references :user 
      t.date :workout_date
      t.text :workout

      t.timestamps
    end
  end
end
