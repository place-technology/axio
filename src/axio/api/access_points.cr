module Axio
  module Api
    class AccessPoints
      def initialize(@session : Session)
      end

      def all : Halite::Response
        @session.get("/v1/accesspoint/all")
      end

      def grant(id : String) : Halite::Response
        @session.post("/v1/accesspoint/grant", json: {"ID" => id})
      end

      def lock(id : String, permanent : String) : Halite::Response
        @session.post("/v1/accesspoint/lock", json: {"ID" => id, "Permanent" => permanent})
      end

      def unlock(id : String, permanent : String) : Halite::Response
        @session.post("/v1/accesspoint/unlock", json: {"ID" => id, "Permanent" => permanent})
      end

      def status(id : String) : Halite::Response
        @session.post("/v1/accesspoint/status", json: {"ID" => id})
      end

      def history(id : String) : Halite::Response
        @session.post("/v1/accesspoint/history", json: {"ID" => id})
      end

      def reload(id : String) : Halite::Response
        @session.get("/v1/accesspoint/reload")
      end
    end
  end
end
