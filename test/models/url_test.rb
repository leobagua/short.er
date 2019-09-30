require 'test_helper'
require "benchmark"

class UrlTest < ActiveSupport::TestCase
  test 'Validations' do
    url = Url.new

    refute url.valid?
    assert url.errors.full_messages.include? "Usuário é obrigatório(a)"
    assert url.errors.full_messages.include? "Url Longa não pode ficar em branco"
    assert url.errors.full_messages.include? "Url Longa não é uma url válida"
    assert url.errors.full_messages.include? "Descrição não pode ficar em branco"
    assert url.errors.full_messages.include? "Cor não pode ficar em branco"
  end

  test 'Scopes' do
    user = User.first
    assert_difference 'Url.count', 50, 'Must generate 50 url records' do
      50.times do
        create :url, user: user
      end
    end

    assert_equal 2, User.count
    assert_equal 50, Url.from_current_user(user).count
  end

  test 'Belongs to associations' do
    url = create :url

    assert url.user.present?
    assert url.user.is_a?(User)
  end

  test 'Has many associations' do
    url = create :url

    5.times do
      create :click, url: url
    end

    assert_not_empty url.clicks
    assert_equal 5, url.clicks
    assert url.first.user.is_a?(Click)
  end

  test 'Unique short link' do
    url = create :url
    new_url = Url.new url.attributes.except('id')

    assert new_url.valid?
  end
end