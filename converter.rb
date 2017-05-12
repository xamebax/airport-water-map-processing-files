require "csv"
require "geocoder"

airports_array = CSV.read("european-airports_raw", { :col_sep => "\t" })

File.open("airports_with_location", "w+") do |f|
  airports_array.each do |airport|
    airport << Geocoder.search("#{airport[0]} #{airport[1]}")[0].data["geometry"]["location"]
    f.write(airport)
  end
end
