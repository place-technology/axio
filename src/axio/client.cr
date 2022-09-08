module Axio
  class Client
    property access_points : Api::AccessPoints

    def initialize(base_url : String, username : String, password : String)
      session = Session.new(base_url: base_url, username: username, password: password)

      @access_points = Api::AccessPoints.new(session)
    end
  end
end
