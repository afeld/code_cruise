json.array!(@relationships) do |relationship|
  json.extract! relationship, :parent_id, :child_id
  json.url relationship_url(relationship, format: :json)
end