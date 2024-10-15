module Axio
  class Session
    Log = ::Log.for(self)

    property single_request_timeout : Int32 = Constants::DEFAULT_SINGLE_REQUEST_TIMEOUT
    property user_agent : String = ["Axio", Constants::VERSION].join(" ")

    private property client : Halite::Client = Halite::Client.new

    def initialize(@base_url : String, @username : String, @password : String)
    end

    def request(method : String, url : String, **kwargs) : Halite::Response
      # Abstract base method for making requests to the AxiomXa APIs.
      # This base method:
      #     * Expands the API endpoint URL to an absolute URL
      #     * Makes the actual HTTP request to the API endpoint
      #     * Provides support for AxiomXa rate-limiting
      #     * Inspects response codes and raises exceptions as appropriate

      absolute_url = URI.parse(@base_url).resolve(url).to_s

      @client.headers({"User-Agent" => @user_agent})
      @client.headers({"Content-Type" => "application/json"})
      @client.timeout single_request_timeout

      url = URI.parse(@base_url).resolve("/v1/login").to_s
      response = @client.post(url, json: {"Username" => @username, "Password" => @password})
      body = JSON.parse(response.body)

      @client.headers({"Authorization" => ["Bearer", body["Key"].to_s].join(" ")})

      case method
      when "GET"
        response = @client.get absolute_url
      when "POST"
        response = @client.post absolute_url, **kwargs
      when "PUT"
        response = @client.put absolute_url, **kwargs
      when "DELETE"
        response = @client.delete absolute_url, **kwargs
      else
        raise Exception.new("The request-method type is invalid.")
      end

      case response.status_code
      when 200, 201, 202, 203, 204
        return response
      else
        raise Exception.new("An exception occured with a status code of #{response.status_code}")
      end
    end

    def get(url : String) : Halite::Response
      # Sends a GET request.
      request("GET", url)
    end

    def post(url : String, **kwargs) : Halite::Response
      # Sends a POST request.
      request("POST", url, **kwargs)
    end

    def put(url : String, **kwargs) : Halite::Response
      # Sends a PUT request.
      request("PUT", url, **kwargs)
    end

    def delete(url : String, **kwargs) : Halite::Response
      # Sends a DELETE request.
      request("DELETE", url, **kwargs)
    end
  end
end
