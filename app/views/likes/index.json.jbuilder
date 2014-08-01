json.array!(@likes) do |like|
  json.extract! like, :id, :likeable_id, :likeable_type, :user_id
  json.url like_url(like, format: :json)
end
