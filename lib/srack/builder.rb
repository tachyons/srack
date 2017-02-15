module Srack
  class Builder
    def initialize(&block)
      instance_eval(&block) if block_given?
    end

    def run(app)
      @app = app
    end

    def to_app
      @app
    end

    def self.parse_file(config)
      config_file = ::File.read(config)
      new_from_string(config_file)
    end

    def self.new_from_string(builder_script)
      eval "Srack::Builder.new {\n" + builder_script + "\n}.to_app"
    end
  end
end
