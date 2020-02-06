class Api::V1::CurrenciesController < ApplicationController
  include Paginable

  before_action :check_credentials, only: %i[index show]
  before_action :set_currency, only: [:show]

  def index
    @currencies = Currency.page(current_page).per(per_page).all

    options = {
      links: {
        first: api_v1_currencies_path(page: 1),
        last: api_v1_currencies_path(page: @currencies.total_pages),
        prev: api_v1_currencies_path(page: @currencies.prev_page),
        next: api_v1_currencies_path(page: @currencies.next_page),
      }
    }

    render json: CurrencySerializer.new(@currencies, options).serializable_hash
  end

  def show
    render json: CurrencySerializer.new(@currency).serializable_hash
  end

  private

  def set_currency
    @currency = Currency.find(params[:id])
  end
end
