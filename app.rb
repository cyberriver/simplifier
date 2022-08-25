require 'rack'
class App

  def call(env)
    puts "REQUESTING RACK REQUEST......"
    request = Rack::Request.new(env)
    puts "LOG: CORRECT #{request} #{request.path} "
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
