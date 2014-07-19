describe DataLog do

  it 'should count the number of rows' do
    data = [{}, {}, {}]
    data_log = DataLog.new(data)
    expect(data_log.row_count).to equal 3
  end

end