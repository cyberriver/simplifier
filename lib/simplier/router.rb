require_relative 'router/route'

module Simplier
  class Router

    def initialize
      @routes = []    
    end

    def get(path, route_point)
      add_route(:get, path, route_point)
    end

    def post(path, route_point)
      add_route(:post,  path, route_point)
    end

    def route_for(env)
      method = env['REQUEST_METHOD'].downcase.to_sym
      path = env['PATH_INFO']

      @routes.find{ |route| route.match?(method, path)}  
    end

    private

    def add_route(method, path, route_point)
      route_point = route_point.split('#')
      action = route_point[1]
      route = Route.new(method, path, Controller, action)
      @routes.push(route)
    end
    
  end
end