module Srack
  class Builder
    def initialize(&block)
      @use = []
      instance_eval(&block) if block_given?
    end

    def run(app)
      @run = app
    end

    def use(middleware, *args, &block)
      @use << proc {|app| middleware.new(app, *args, &block)}
    end

    def to_app
      app = @run
      app = @use.reverse.inject(app) { |a,e| e[a] }
      binding.pry
      app
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
