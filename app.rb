require 'rack'
class App

  def call(env)
    request = Rack::Request.new(env)
    serve_request(request)
  end

  private

  def serve_request
    [status, headers, body]
  end

  def status
    200
  end

  def headers
    {'Content-Type'=>'text/plain'}
  end

  def body
    ["Welcome aboard!\n"]
  end


end
