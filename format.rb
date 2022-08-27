module Format
  CORRECT_FORMAT = ['year', 'month', 'day', 'hour', 'minute', 'second']
  DATE_DIRECTIVES = {'year'=> '%Y',
                     'month'=> '%m',
                     'day'=>'%d',
                     'hour'=>'%H',
                     'minute'=>'%M',
                     'second'=> '%S'}.freeze

  def has_format?(params)
    true if params.key?("format") && params["format"].size>0
  end


  def verify_params(params)
    @diff = find_difference(split_params(params))
    true if @diff.size == 0
  end

  private

  def split_params(params)
    params.split(',')
  end

  def find_difference(arr)
    arr - CORRECT_FORMAT
  end

  def set_date_directives(params)
    params.map! {|a| a = DATE_DIRECTIVES[a]}
    @options = params
    puts "params set_date_directives #{params}"
  end

end
