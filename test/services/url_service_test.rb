require 'test_helper'

class UrlServiceTest < ActiveSupport::TestCase
  test 'Create a new valid Url' do
    assert_difference 'Url.count', 1, 'Should have created a new url'do
      assert_nothing_raised { UrlService.create_url description: 'Google Url', long: 'google.com', user: User.first }
    end
  end

  test 'Create a new invalid Url' do
    assert_no_difference 'Url.count', 'Should not have generated a new url' do
      assert_nothing_raised { UrlService.create_url description: '', long: '' }
    end
  end

  test 'Update a new valid Url' do
    url = create :url
    assert_nothing_raised { UrlService.update_url url, { description: 'New Description' } }

    assert url.has_updated?
    assert_equal 'New Description', url.reload.description
  end

  test 'Update a new invalid Url' do
    url = create :url
    assert_nothing_raised { UrlService.update_url url, { description: nil } }

    refute url.has_updated?
    assert url.errors.full_messages.include? "Descrição não pode ficar em branco"
  end

  test 'Invalid urls' do
    refute UrlService.valid_url? '.com.br'
    refute UrlService.valid_url? '.com'
    refute UrlService.valid_url? 'com'
    refute UrlService.valid_url? '.br'
    refute UrlService.valid_url? 'br'
    refute UrlService.valid_url? 'net'
    refute UrlService.valid_url? 'invalid'
    refute UrlService.valid_url? 'http://'
    refute UrlService.valid_url? 'https://'
    refute UrlService.valid_url? 'ftp://'
    refute UrlService.valid_url? 'udp://google.com'
    refute UrlService.valid_url? 'tcp://google.com'
    refute UrlService.valid_url? 'google.net?q=test'
  end

  test 'Valid urls' do
    assert UrlService.valid_url? 'com.br'
    assert UrlService.valid_url? 'https://com.br'
    assert UrlService.valid_url? 'http://google.com'
    assert UrlService.valid_url? 'ftp://google.com'
    assert UrlService.valid_url? 'google.com.br'
    assert UrlService.valid_url? 'google.com/search'
    assert UrlService.valid_url? 'google.com/search?q=test'
    assert UrlService.valid_url? 'google.net/?q=test'
  end
end