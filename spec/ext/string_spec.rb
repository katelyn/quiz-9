describe String do

  describe '#duration_to_seconds' do
    it 'should raise an exception when the format is not recognized' do
      expect { 'not_a_duration'.duration_to_seconds }.to raise_error 'not_a_duration is not a valid duration'
    end

    it 'should have a zero duration for 000:00:00' do
      expect('000:00:00'.duration_to_seconds).to equal(0)
    end

    it 'should have a count of the number of seconds for the seconds field' do
      expect('000:00:25'.duration_to_seconds).to equal(25)
    end
  end

end