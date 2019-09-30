require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  test 'Validations' do
    url = Url.new
    refute url.valid?
    assert url.errors.full_messages.include? "Short can't be blank"
    assert url.errors.full_messages.include? "Long can't be blank"
    assert url.errors.full_messages.include? "Description can't be blank"
  end
end