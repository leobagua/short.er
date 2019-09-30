require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Validations' do
    user = User.new
    refute user.valid?
    assert user.errors.full_messages.include? "Email não pode ficar em branco"
    assert user.errors.full_messages.include? "Senha não pode ficar em branco"
  end
end
