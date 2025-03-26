FactoryBot.define do
    factory :user do
      name { 'テストユーザー' }
      email { 'test@example.com' }
      password { 'password112' }
      password_confirmation { 'password112' }
    end
  end