require 'csv'

describe 'Quiz Output' do

  it 'should have a report with all requested information' do
    csv = CSV.open("#{Dir.pwd}/data/quiz1.csv", col_sep: ';', headers: true)
    data_log = DataLog.new(csv)

    expect(data_log.report).to eq(expected_data_log_report)
  end

  private

  def expected_data_log_report
    'Data Report:' +
        "\n\t1: 46" +
        "\n\t2: 6" +
        "\n\t3: 208.37.201.215=12; 208.51.154.200=6; 208.69.83.142=2; 67.211.162.224=4; 69.44.55.132=4; 72.35.229.246=8; 76.10.192.169=10" +
        "\n\t4: 18226"
  end

end