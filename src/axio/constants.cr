module Axio
  module Constants
    VERSION = {{ `shards version "#{__DIR__}"`.chomp.stringify.downcase }}

    DEFAULT_SINGLE_REQUEST_TIMEOUT = 60

    STATUS_CODES = {
      400 => "Bad Request",
      401 => "Unauthorized",
      403 => "Forbidden",
      404 => "Not Found",
      500 => "Internal Server Error",
    }
  end
end
