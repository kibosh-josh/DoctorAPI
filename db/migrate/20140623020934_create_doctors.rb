class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :address
      t.string :insurance_plan
      t.string :latitude
      t.string :longitude
      t.string :specialty
      t.string :phone
      t.string :medical_group
      t.string :city
      t.string :zip_code

      t.timestamps
    end
  end
end
