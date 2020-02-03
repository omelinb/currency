require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase
  test 'should have a uniq code' do
    other_currency = currencies(:one)
    currency = Currency.new(
      name: 'test',
      rate: 'test',
      nominal: 'test',
      code: other_currency.code)
    assert_not currency.valid?
  end
end
