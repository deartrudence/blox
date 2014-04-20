json.array!(@blocs) do |bloc|
  json.extract! bloc, :id, :name, :code, :category
  json.url bloc_url(bloc, format: :json)
end
