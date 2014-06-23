class Doctor < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  def self.cchp
    Doctor.where("insurance_plan = ?", "cchp_bronze_60_HMO")
  end

  def self.blue_cross
    Doctor.where("insurance_plan = ?", "blue_cross_bronze_60_PPO")
  end

  def self.blue_shield
    Doctor.where("insurance_plan = ?", "blue_shield_bronze_60_PPO")
  end
  
  def self.kaiser
    Doctor.where("insurance_plan = ?", "kaiser_bronze_HMO_4500_40")
  end
end