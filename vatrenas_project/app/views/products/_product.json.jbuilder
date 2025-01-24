json.extract! product, :id, :name, :description, :price, :currency, :quantity, :image, :created_at, :updated_at
json.url product_url(product, format: :json)
