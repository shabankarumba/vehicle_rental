class Driver < Partner
  has_many :driver_insurances, foreign_key: "driver_id"

  def total_days_charged_for_all_driver_insurance_policies
    driver_insurances.sum(&:number_of_days)
  end

  def total_price_for_all_driver_insurance_policies 
    driver_insurances.sum(&:driver_insurance_policy)
  end
end
