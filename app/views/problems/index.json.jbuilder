json.array!(@problems) do |problem|
  json.extract! problem, :id, :content
  json.url problem_url(problem, format: :json)
end
