class ClickCountJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ClickService.create_click args.extract_options!
  end
end
