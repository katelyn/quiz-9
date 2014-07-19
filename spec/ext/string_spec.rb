describe String do

  describe '#duration_to_seconds' do
    it 'should have a zero duration for 000:00:00' do
      expect('000:00:00'.duration_to_seconds).to equal(0)
    end
  end

end