describe String do

  describe '#duration_to_seconds' do
    it 'should be nil when the duration format is not recognized' do
      expect('not_a_duration'.duration_to_seconds).to eq(nil)
    end

    it 'should have a zero duration for 000:00:00' do
      expect('000:00:00'.duration_to_seconds).to eq 0
    end

    it 'should count the number of seconds for the seconds field' do
      expect('000:00:03'.duration_to_seconds).to eq 3
    end

    it 'should count the number of seconds for the minutes field' do
      expect('000:02:00'.duration_to_seconds).to eq 120
    end

    it 'should count the number of seconds for the hours field' do
      expect('012:00:00'.duration_to_seconds).to eq 43200
    end

    it 'should add all fields of the duration together' do
      expect('020:34:28'.duration_to_seconds).to eq 74068
    end
  end

  describe '#^' do
    it 'should be able to xor two strings of equal length' do
      expect('dog' ^ 'cat').to eq("\a\u000E\u0013")
    end

    it 'should be able to xor two strings when the receiver is shorter in length' do
      expect('pups' ^ 'kittens').to eq("\e\u001C\u0004\a")
    end

    it 'should be able to xor two strings when the argument is shorter in length' do
      expect('kittens' ^ 'pups').to eq("\e\u001C\u0004\a")
    end
  end

end