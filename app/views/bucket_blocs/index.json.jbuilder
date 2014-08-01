json.array!(@bucket_blocs) do |bucket_bloc|
  json.extract! bucket_bloc, :id, :user_id, :bloc_id
  json.url bucket_bloc_url(bucket_bloc, format: :json)
end
