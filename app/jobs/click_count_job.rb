class ClickCountJob < ApplicationJob
  queue_as :default

  def perform(*args)
    attributes = args.extract_options!
    country = Geocoder.search(attributes[:ip]).first.country.presence || 'N/A'
    attributes.merge!(country: country)
    ClickService.create_click attributes
  end
end