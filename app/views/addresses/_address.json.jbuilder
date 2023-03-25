json.extract! address, :id, :street, :province, :country, :zip, :phone, :created_at, :updated_at
json.url address_url(address, format: :json)
