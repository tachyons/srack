module Srack
  class Server
    def initialize
      @options = default_options 
      @options[:config] = ARGV[0][0] if ARGV[0][0]
      @app = build_app
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
        Host: "localhost",
        config: 'config.ru'
      }
    end

    def build_app
      Builder.parse_file(@options[:config])
    end
  end
end
