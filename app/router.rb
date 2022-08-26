class Router
  def initialize(request)
    @request = request
  end

  def route!(params)
    if @request.path == "/"
      [200, { "Content-Type" => "text/plain" }, ["Hello from the Router"]]
    else
      begin
        send(@request.path.to_s[1..],params)
      rescue NoMethodError => e
        puts "#{@request.path.to_s[1..]} resource is not_found"
        not_found
      end
    end
  end

  private

  def time(params)
    msg = Time.now.strftime(params.join('-')).to_s
    [200, { "Content-Type" => "text/plain" }, [msg]]
  end

  def not_found(msg = "Not Found")
    [404, { "Content-Type" => "text/plain" }, [msg]]
  end


end
