require 'test_helper'

class ClickServiceTest < ActiveSupport::TestCase
  test 'Create a new valid Click' do
    assert_difference 'Click.count', 1, 'Should have created a new url'do
      assert_nothing_raised { ClickService.create_click ip: '127.0.0.1', country: 'BR', url: create(:url) }
    end
  end

  test 'Click info from url' do
    url = create :url

    assert_difference 'Click.count', 10 do
      5.times do
        create :click, url: url, date: Date.today, country: 'BR'
        create :click, url: url, date: Date.tomorrow, country: 'US'
      end
    end

    query = ClickService.clicks_info_from url

    assert_equal 2, query[:clicks_by_date].to_a.size

    assert_equal 5, query[:clicks_by_date].to_a.first.number_of_clicks
    assert_equal Date.today, query[:clicks_by_date].to_a.first.date

    assert_equal 2, query[:clicks_by_date].to_a.size
    assert_equal 5, query[:clicks_by_date].to_a.last.number_of_clicks
    assert_equal Date.tomorrow, query[:clicks_by_date].to_a.last.date

    assert_equal 2, query[:clicks_by_country].to_a.size

    assert_equal 2, query[:clicks_by_country].to_a.size
    assert_equal 5, query[:clicks_by_country].to_a.first.number_of_clicks
    assert_equal 'BR', query[:clicks_by_country].to_a.first.country

    assert_equal 2, query[:clicks_by_country].to_a.size
    assert_equal 5, query[:clicks_by_country].to_a.last.number_of_clicks
    assert_equal 'US', query[:clicks_by_country].to_a.last.country
  end
end