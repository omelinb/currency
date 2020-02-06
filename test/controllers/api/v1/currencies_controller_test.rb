require 'test_helper'

class Api::V1::CurrenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @currency = currencies(:one)
  end

  test 'should not show currency' do
    get api_v1_currency_url(@currency), as: :json
    assert_response :forbidden
  end

  test 'should show currency' do
    get api_v1_currency_url(@currency),
      headers: { Authorization: ENV['CURRENCY_SECRET_API_KEY'] },
      as: :json
    assert_response :success

    json_response = JSON.parse(response.body)
    assert_equal @currency.code, json_response['data']['attributes']['code']
  end

  test 'should not show currencies' do
    get api_v1_currencies_url, as: :json
    assert_response :forbidden
  end

  test 'should show currencies' do
    get api_v1_currencies_url,
      headers: { Authorization: ENV['CURRENCY_SECRET_API_KEY'] },
      as: :json
    assert_response :success

    json_response = JSON.parse(response.body, symbolize_names: true)
    assert_not_nil json_response.dig(:links, :first)
    assert_not_nil json_response.dig(:links, :last)
    assert_not_nil json_response.dig(:links, :prev)
    assert_not_nil json_response.dig(:links, :next)
  end
end
