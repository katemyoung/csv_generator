FactoryBot.define do
  factory :enapsa_monthly_report do
    employer { attributes_for(:employer) }    
    year { 2022 } 
    month { "06" }

    initialize_with { new(employer, year, month) }
  end
end
