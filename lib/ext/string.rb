class String

  DURATION_FORMAT = Regexp.new('^(?<hours>\d{3}):(?<minutes>\d{2}):(?<seconds>\d{2})$')
  SECONDS_PER_MINUTE = 60


  def duration_to_seconds
    match_data = DURATION_FORMAT.match(self)
    raise "#{self} is not a valid duration" unless match_data
    seconds = match_data['seconds'].to_i
    minutes_in_seconds = match_data['minutes'].to_i * SECONDS_PER_MINUTE
    seconds + minutes_in_seconds
  end
end