require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase
  test 'should have a positive rate' do
    currency = currencies(:one)
    currency.rate = -1
    assert_not currency.valid?
  end

  test 'should have a uniq name' do
    other_currency = currencies(:one)
    currency = Currency.new(name: other_currency.name, rate: 1)
    assert_not currency.valid?
  end
end
