FactoryBot.define do
  factory :click do
    ip { "127.0.0.1" }
    country { "Brazil" }
    url { Url.first || create(:url) }
    date { Date.today }
  end
end