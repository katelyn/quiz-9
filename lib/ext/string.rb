class String

  DURATION_FORMAT = Regexp.new('^(?<hours>\d{3}):(?<minutes>\d{2}):(?<seconds>\d{2})$')

  def duration_to_seconds
    match_data = DURATION_FORMAT.match(self)
    raise "#{self} is not a valid duration" unless match_data
    match_data['seconds'].to_i
  end
end