module Axio
  class Client
    property access_points : Api::AccessPoints

    def initialize(base_url : String, username : String, password : String)
      client = Halite::Client.new
      client.headers({"Content-Type" => "application/json"})
      url = URI.parse(base_url).resolve("/v1/login").to_s
      response = client.post(url, json: {"Username" => username, "Password" => password})
      body = JSON.parse(response.body)

      session = Session.new(base_url, body["Key"].to_s)

      @access_points = Api::AccessPoints.new(session)
    end
  end
end
