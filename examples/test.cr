require "../src/axio"

Log.setup(:debug)

client = Axio::Client.new(base_url: "http://130.113.46.137:60001", username: "axiomtest1", password: "UpTheTree1!")

client.access_points.unlock(id: "2127", permanent: "true")
client.access_points.lock(id: "2127", permanent: "true")
pp client.access_points.status(id: "2127").body

response = client.try(&.access_points.status(id: "54017"))
pp JSON.parse(response.body)