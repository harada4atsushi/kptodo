json.array!(@tries) do |try|
  json.extract! try, :id, :content
  json.url try_url(try, format: :json)
end
