class CreateDoctorSpecializations < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor_specializations do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :specialization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
