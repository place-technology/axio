require "../src/axio"

Log.setup(:debug)

client = Axio::Client.new(base_url: "http://127.0.0.1:60001", username: "test", password: "test")

client.access_points.unlock(id: "1", permanent: "true")
client.access_points.lock(id: "1", permanent: "true")
