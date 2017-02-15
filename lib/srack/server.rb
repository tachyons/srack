module Srack
  class Server
    def initialize
     @options = default_options 
    end

    def self.start
      new.start
    end

    def start
    end

    private
    
    def default_options
      {
        environment: "localhost",
        Port: "9393",
        Host: "localhost"
      }
    end
  end
end
