require_relative 'simplier/application'

module Simplier

    class << self
      def application
        Application.instance
      end
    end
end