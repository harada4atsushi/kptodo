json.array!(@kpts) do |kpt|
  json.extract! kpt, :id, :title
  json.url kpt_url(kpt, format: :json)
end
