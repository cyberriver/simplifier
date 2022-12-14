require 'singleton'
require_relative 'router'
require_relative 'controller'

module Simplier
   class Application

    include Singleton

    def initialize
      @router = Router.new    
    end

    def call (env)
      route = @router.route_for(env)
      controller = route.controller.new(env)
      action = route.action

      make_response(controller, action)
    end

    def routes(&block)
      @router.instance_eval(&block)
              
    end

    def bootstrap!
      require_app
      require_routes
    end

    private

    def require_app
      Dir["#{Simplier.root}/app/**/*.rb"].each { |file| require file}

    end  #globbin technig

    def require_routes
      require Simplier.root.join('config/routes')
    end

    def make_response(controller, action)
      controller.make_response(action)
    end


   end
end