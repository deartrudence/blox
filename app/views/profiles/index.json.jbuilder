json.array!(@profiles) do |profile|
  json.extract! profile, :id, :handle, :company, :bio, :website, :user_id
  json.url profile_url(profile, format: :json)
end
