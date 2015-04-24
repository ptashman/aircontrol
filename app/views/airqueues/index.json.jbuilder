json.array!(@airqueues) do |airqueue|
  json.extract! airqueue, :id
  json.url airqueue_url(airqueue, format: :json)
end
