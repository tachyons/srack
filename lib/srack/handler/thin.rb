require 'thin'
module Srack
  module Handler
    class Thin
      def self.run(app, options = {})
        host = options[:Host]
        port = options[:Port]
        args = [host, port, app, options]
        server = ::Thin::Server.new(*args)
        server.start
      end
    end
  end
end
