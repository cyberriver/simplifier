module Simplier
  class Controller
    def initialize(env)
      @request = Rack::Request.new(env)
      @response = Rack::Response.new
    end

    def make_response(action)
      [
        200,
        {'Content-Type' => 'text/plain', 'X-Simplier-Action'=>action},
        ['Simplier framework in action!\n']
      ]
    end
  end
end