require 'pathname'
require_relative 'simplier/application'

module Simplier

    class << self
      def application
        Application.instance
      end

      def root
        Pathname.new(File.expand_path('..', __dir__))
      end
    end
    
end