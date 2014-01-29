json.array!(@authors) do |author|
  json.extract! author, :id, :id, :name
  json.url author_url(author, format: :json)
end
