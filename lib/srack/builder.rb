module Srack
  class Builder
    def self.parse_file(config)
      config_file = ::File.read(config)
      new_from_string(config_file)
    end

    def new_from_string(builder_script)
      eval "Rack::Builder.new {\n" + builder_script + "\n}.to_app"
    end
  end
end
