json.extract! user, :id, :fname, :lname, :email, :password, :admin, :address_id, :created_at, :updated_at
json.url user_url(user, format: :json)
