FactoryBot.define do 
    factory :measurement do 
        measurement_name { Faker::Name.unique.name }
    end
end