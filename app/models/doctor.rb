class Doctor < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode, if: Proc.new { |a| a.latitude == nil || a.longitude == nil }

  def self.cchp
    Doctor.where("insurance_plan = ?", "cchp")
  end

  def self.blue_cross_PPO_and_EPO
    Doctor.where("insurance_plan = ?", "blue_cross_bronze_60_PPO")
  end

  def self.blue_cross_HMO
    Doctor.where("insurance_plan = ?", "blue_cross_HMO")
  end

  def self.blue_shield_PPO
    Doctor.where("insurance_plan = ?", "blue_shield_bronze_60_PPO")
  end

  def self.blue_shield_EPO
    Doctor.where("insurance_plan = ?", "blue_shield_EPO")
  end
  
  def self.kaiser_HMO
    Doctor.where("insurance_plan = ?", "kaiser_HMO")
  end

  def full_address
    address + ", " + city + "" + " CA " + zip_code
  end
end