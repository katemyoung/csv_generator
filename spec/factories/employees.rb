FactoryBot.define do
  factory :employee do
    ssn { 123456789 }
    nrc { "123456/78/9" }
    surname { "Banda" }
    first_name { "Mary" }
    other_name { "Chungu" }
    dob { "1980-05-23" }
  end
end
