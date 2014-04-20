json.array!(@webpages) do |webpage|
  json.extract! webpage, :id, :name, :bloc_id
  json.url webpage_url(webpage, format: :json)
end
