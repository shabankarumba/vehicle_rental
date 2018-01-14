require 'rails_helper' 

RSpec.describe Driver, type: :model do
  let(:driver) { Driver.create(name: "Danny Driver") }
  
  it "calculates the number of days to charge for all the insurance for one driver" do
    driver_insurance = DriverInsurance.create(start_date: Date.today, end_date: Date.today + 1.week, driver: driver)
    driver_insurance2 = DriverInsurance.create(start_date: Date.today - 3.weeks, end_date: Date.today - 1.week, driver: driver)

    expect(driver.total_days_charged_for_all_driver_insurance_policies).to eq 21
  end

  it "calculates the price for all the insurance for one driver" do
    vehicle = Vehicle.create(driver_insurance_daily_rate_pounds: 58.50)
    driver_insurance = DriverInsurance.create(start_date: Date.today, end_date: Date.today + 1.week, vehicle: vehicle, driver: driver)
    driver_insurance_two = DriverInsurance.create(start_date: Date.today + 1.day, end_date: Date.today + 1.week, vehicle: vehicle, driver: driver)

    expect(driver.total_price_for_all_driver_insurance_policies).to eq(760.5)
  end
end
