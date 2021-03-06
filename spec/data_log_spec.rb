describe DataLog do

  let(:data) { [] }
  subject(:data_log) { DataLog.new(data) }

  it 'should count the number of rows' do
    data.concat [{}, {}, {}]
    expect(data_log.row_count).to eq 3
  end

  describe '#call_dest_with_value_count' do
    before do
      data.concat [{'call-dest' => '208.51.154.200'}, {'call-dest' => '1.2.3.4'}, {'call-dest' => '208.51.154.200'}]
    end

    it 'should have no matching values when the search value is not found' do
      expect(data_log.call_dest_with_value_count('9.8.7.l6')).to eq 0
    end

    it 'should count the number of rows whose call-dest column has the value 208.51.154.200' do
      expect(data_log.call_dest_with_value_count('208.51.154.200')).to eq 2
    end
  end

  describe '#call_dest_with_unique_values' do
    before do
      data.concat [{'call-dest' => 'abc'}, {'call-dest' => 'def'}, {'call-dest' => 'abc'}]
    end

    it 'should produce a hash of the count of unique values for a given column' do
      expect(data_log.call_dest_with_unique_values).to eq({'abc' => 2, 'def' => 1})
    end
  end

  describe '#total_call_duration' do
    before { data.concat [{'call-duration' => '000:00:34'}, {'call-duration' => '000:00:12'}] }

    it 'should calculate the total call duration' do
      expect(data_log.total_call_duration).to eq 46
    end
  end

  describe '#called_party_on_dest_decoding' do
    before do
      data.concat [{'called-party-on-dest' => 'GwAJCA=='},
                   {'called-party-on-dest' => 'FAoKAA=='},
                   {'called-party-on-dest' => 'GwAJCA=='}]
    end

    it "should count the number of columns that decode to a specific value after being xor'd" do
      expect(data_log.count_called_party_on_dest_decoding_matches('seed', 'hello'))
    end
  end

end