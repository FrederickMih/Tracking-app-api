Factotories.define do 
    factory :measure do
        user { create :user}
        product { create :measurement}
        data { rand * 10.round }
    end
end