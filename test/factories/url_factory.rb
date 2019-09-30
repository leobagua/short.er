FactoryBot.define do
  factory :url do
    description { "Google Url" }
    long { "https://google.com" }
    user { User.first }
    color { "#fff" }
  end
end