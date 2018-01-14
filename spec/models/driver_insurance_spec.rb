# frozen_string_literal: true

require "rails_helper"

RSpec.describe DriverInsurance, type: :model do
  let(:driver) { Partner.create(name: "Danny Driver") }

  it "calculates the number of days to charge for a driver insurance policy" do
    driver_insurance = DriverInsurance.create(start_date: Date.today, end_date: Date.today + 1.week)
    expect(driver_insurance.number_of_days).to eq 7
  end

  it "calculates the price for a driver insurance policy" do
    vehicle = Vehicle.create(driver_insurance_daily_rate_pounds: 58.50)
    driver_insurance = DriverInsurance.create(start_date: Date.today, end_date: Date.today + 1.week, vehicle: vehicle)
    expect(driver_insurance.driver_insurance_policy).to eq 7 * 58.50
  end
end
