class Api::V1::CurrenciesController < ApplicationController
  before_action :set_currency, only: [:show]

  def index
    @currencies = Currency.all
    render json: @currencies
  end

  def show
    render json: @currency
  end

  private

  def set_currency
    @currency = Currency.find(params[:id])
  end
end
