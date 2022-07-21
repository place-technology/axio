require "halite"
require "./axio/**"

module Axio
end

Log.setup(:debug)

client = Axio::Client.new(base_url: "http://130.113.46.137:60001", username: "axiomtest1", password: "UpTheTree1!")

client.access_points.unlock(id: "2127", permanent: "true")
client.access_points.lock(id: "2127", permanent: "true")
