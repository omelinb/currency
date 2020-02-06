class Api::V1::CurrenciesController < ApplicationController
  before_action :check_credentials, only: %i[index show]
  before_action :set_currency, only: [:show]

  def index
    @currencies = Currency.all
    render json: CurrencySerializer.new(@currencies).serializable_hash
  end

  def show
    render json: CurrencySerializer.new(@currency).serializable_hash
  end

  private

  def set_currency
    @currency = Currency.find(params[:id])
  end
end
