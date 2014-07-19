describe DataLog do

  let(:data) { [] }
  let(:data_log) { DataLog.new(data) }

  it 'should count the number of rows' do
    data.concat [{}, {}, {}]
    expect(data_log.row_count).to equal 3
  end

  describe '#call_dest_with_value_count' do
    before { data.concat [{'call-dest' => '208.51.154.200'}, {'call-dest' => '1.2.3.4'}, {'call-dest' => '208.51.154.200'}] }

    it 'should count the number of rows whose call-dest column has the value 208.51.154.200' do
      expect(data_log.call_dest_with_value_count('208.51.154.200')).to equal 2
    end

    it 'should have no matching values when the search value is not found' do
      expect(data_log.call_dest_with_value_count('9.8.7.l6')).to equal 0
    end
  end

end