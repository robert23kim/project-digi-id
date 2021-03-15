# spec/factories/movies.rb
require 'faker'
I18n.reload!

FactoryGirl.define do
  factory :user do
    username "john123"
    password_digest "12345"
  end
  factory :collectible do
    name "Kitska Warmbestrarity"
    rarity 0.001
    url "https://lh3.googleusercontent.com/4YPexPRmyHJ_BW_f41KKO-QdOD_vffe0ndD3tt7vu7ZCsPydNBSVy1Je-7F781SLgWP37ujmkHqhGSBUYSp4nGxKitBd6MqDlxkssg=s992"
    value 10
  end
end