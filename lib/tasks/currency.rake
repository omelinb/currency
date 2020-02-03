namespace :currency do
  desc 'update currencies rates'
  task :update => :environment do
    uri = 'http://www.cbr.ru/scripts/XML_daily.asp'
    doc = open(uri)
    data = Hash.from_xml(doc)
    rates = data['ValCurs']['Valute']

    now = Time.now
    rows = rates.map do |rate|
      { 
        code: rate['CharCode'],
        rate: rate['Value'],
        nominal: rate['Nominal'],
        name: rate['Name'],
        created_at: now,
        updated_at: now
      }
    end

    Currency.upsert_all(rows, unique_by: :code)
  end
end
