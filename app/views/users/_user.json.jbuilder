json.extract! user, :id, :admin, :nome, :created_at, :updated_at
json.url user_url(user, format: :json)
