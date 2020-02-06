class CurrencySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :code, :rate, :nominal
end
