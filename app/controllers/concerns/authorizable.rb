module Authorizable
  def check_credentials
    header = request.headers['Authorization']
    
    head :forbidden unless header == ENV['CURRENCY_SECRET_API_KEY']
  end
end
