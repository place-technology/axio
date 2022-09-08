module Axio
  module Constants
    VERSION = {{ `shards version "#{__DIR__}"`.chomp.stringify.downcase }}

    DEFAULT_SINGLE_REQUEST_TIMEOUT = 60
  end
end
