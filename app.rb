require 'rack'
require_relative 'format'

class App
include Format

  def call(env)
    puts "REQUESTING RACK REQUEST......"
    request = Rack::Request.new(env)
    puts "LOG: Recived request#{request} path #{request.path} params: #{request.params}"

    #filtering request by incorrect parameters
    if check_params(request)
      set_date_directives(split_params(request.params["format"]))
      serve_request(request, @options)
    else
      incorrect_parameters(@diff) #filtering request by incorrect parameters
    end
  end

  private

  def check_params(request)
    puts "request #{request}"
    params = request.params
    verify_params(params["format"]) if has_format?(params)
  end

  def serve_request(request, params)
    puts "request #{request} params #{params}"
    Router.new(request).route!(params)
  end

  def incorrect_parameters(args)
    msg = "Unknown time format #{args}"
    response = Rack::Response.new(
      [400, { "Content-Type" => "text/plain" }, [msg]]
    )
  end

end
