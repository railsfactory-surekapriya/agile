json.array!(@nations) do |nation|
  json.extract! nation, :id, :country, :Flag_color, :image_url, :capital, :population
  json.url nation_url(nation, format: :json)
end
