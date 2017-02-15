module Srack
  module Handler
    autoload :Thin, 'handler/thin'
    def self.default
      Handler::Thin
    end
  end
end
