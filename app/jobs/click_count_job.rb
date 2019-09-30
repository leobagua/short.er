class ClickCountJob < ApplicationJob
  queue_as :default

  def perform(*args)
    attributes = args.extract_options!
    attributes.merge(country: Geocoder.search(attributes[:ip]).first.country)
    ClickService.create_click attributes
  end
end
