# frozen_string_literal: true

# A Partner can be either a Driver or an Owner

class Partner < ActiveRecord::Base
  has_many :driver_insurances, foreign_key: "driver_id"
  has_many :owned_vehicles, class_name: "Vehicle", foreign_key: "owner_id"

  def total_days_charged_for_all_driver_insurance_policies
    driver_insurances.sum(&:number_of_days)
  end

  def total_price_for_all_driver_insurance
    driver_insurances.sum(&:driver_insurance_policy)
  end

  def total_vehicle_owner_insurance_v2_charges_pounds; end
end
