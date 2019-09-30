class Click < ApplicationRecord
  belongs_to :url, counter_cache: true

  validates :ip, :country, :date, presence: true
end