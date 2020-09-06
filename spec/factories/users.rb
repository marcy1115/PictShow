FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1234abcd' }
    password_confirmation { password }
    sexuality          { '男' }
    birth              { Faker::Date.between( from: '1930-01-01', to: '2015-12-31' ) }
  end
end
