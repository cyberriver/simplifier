class Router
  def initialize(request, params)
    @request = request
    @params = params
    puts "options #{@params}"
  end

  def route!
    if @request.path == "/"
      [200, { "Content-Type" => "text/plain" }, ["Hello from the Router"]]
    else
      begin
        send(@request.path.to_s[1..])
      rescue NoMethodError => e
        puts "#{@request.path.to_s[1..]} resource is not_found"
        not_found
      end
    end
  end

  private

  def time
    msg = Time.now.strftime(@params.join('-')).to_s
    [200, { "Content-Type" => "text/plain" }, [msg]]
  end

  def not_found(msg = "Not Found")
    [404, { "Content-Type" => "text/plain" }, [msg]]
  end


end
