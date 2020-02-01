require 'test_helper'

class Api::V1::CurrenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @currency = currencies(:one)
  end

  test 'should show currency' do
    get api_v1_currency_url(@currency), as: :json
    assert_response :success

    json_response = JSON.parse(response.body)
    assert_equal @currency.name, json_response['name']
  end

  test 'should show currencies' do
    get api_v1_currencies_url(), as: :json
    assert_response :success
  end
end
