class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.text :address
      t.date :birthday
      t.string :birthplace

      t.timestamps null: false
    end
  end
end
