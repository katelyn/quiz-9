describe String do

  describe '#duration_to_seconds' do
    it 'should be nil when the duration format is not recognized' do
      expect('not_a_duration'.duration_to_seconds).to equal(nil)
    end

    it 'should have a zero duration for 000:00:00' do
      expect('000:00:00'.duration_to_seconds).to equal(0)
    end

    it 'should count the number of seconds for the seconds field' do
      expect('000:00:03'.duration_to_seconds).to equal(3)
    end

    it 'should count the number of seconds for the minutes field' do
      expect('000:02:00'.duration_to_seconds).to equal(120)
    end

    it 'should count the number of seconds for the hours field' do
      expect('012:00:00'.duration_to_seconds).to equal(43200)
    end

    it 'should add all fields of the duration together' do
      expect('020:34:28'.duration_to_seconds).to equal(74068)
    end
  end

end