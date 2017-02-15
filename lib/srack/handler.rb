module Srack
  module Handler
    autoload :Thin, 'srack/handler/thin'
    def self.default
      Handler::Thin
    end
  end
end
