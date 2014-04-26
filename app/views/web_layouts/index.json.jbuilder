json.array!(@web_layouts) do |web_layout|
  json.extract! web_layout, :id, :bloc_id, :webpage_id, :position
  json.url web_layout_url(web_layout, format: :json)
end
