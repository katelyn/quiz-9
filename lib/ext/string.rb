class String

  DURATION_FORMAT = Regexp.new('^(?<hours>\d{3}):(?<minutes>\d{2}):(?<seconds>\d{2})$')
  MINUTES_PER_HOUR = 60
  SECONDS_PER_MINUTE = 60


  def duration_to_seconds
    return nil unless (match_data = DURATION_FORMAT.match(self))
    minutes_in_seconds = minutes_to_seconds(match_data['minutes'].to_i)
    hours_in_minute = minutes_to_seconds(hours_to_minutes(match_data['hours'].to_i))
    match_data['seconds'].to_i + minutes_in_seconds + hours_in_minute
  end

  private

  def minutes_to_seconds(minutes)
    minutes * SECONDS_PER_MINUTE
  end

  def hours_to_minutes(hours)
    hours * MINUTES_PER_HOUR
  end
end