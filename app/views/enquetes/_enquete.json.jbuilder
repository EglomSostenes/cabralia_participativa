json.extract! enquete, :id, :titulo, :descricao, :created_at, :updated_at
json.url enquete_url(enquete, format: :json)
