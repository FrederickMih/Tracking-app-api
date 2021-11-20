FactoryBot.define do 
    factory :user do 
        sequence(:username) { |u| "user#{u}"}
        password { '123456' }
        password_confirmation { '123456' }
    end
end