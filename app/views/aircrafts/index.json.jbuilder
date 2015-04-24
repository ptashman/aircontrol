json.array!(@aircrafts) do |aircraft|
  json.extract! aircraft, :id
  json.url aircraft_url(aircraft, format: :json)
end
