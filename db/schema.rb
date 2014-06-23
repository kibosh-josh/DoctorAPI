ActiveRecord::Schema.define(version: 20140623020934) do
  enable_extension "plpgsql"

  create_table "doctors", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "insurance_plan"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "specialty"
    t.string   "phone"
    t.string   "medical_group"
    t.string   "city"
    t.string   "zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
