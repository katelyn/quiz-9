require 'csv'

class DataLog

  def initialize(array_of_hash_like_data)
    @data = array_of_hash_like_data
  end

  def row_count
    data.count
  end

  def call_dest_with_value_count(search_value)
    data.inject(0) { |count, row| row['call-dest'] == search_value ? count + 1 : count }
  end

  def call_dest_with_unique_values
    result = Hash.new { |hash, key| hash[key] = 0 }
    data.each { |row| result[row['call-dest']] += 1 }
    result
  end

  def  total_call_duration
    data.inject(0) { |count, row| row['call-duration'].duration_to_seconds + count }
  end

  def report
    unique_pairs = call_dest_with_unique_values
    unique_call_dest_values_for_reporting = unique_pairs.keys.sort.map { |ip| "#{ip}=#{unique_pairs[ip]}" }.join('; ')

    'Data Report:' +
        "\n\t1: #{row_count}" +
        "\n\t2: #{call_dest_with_value_count('208.51.154.200')}" +
        "\n\t3: #{unique_call_dest_values_for_reporting}" +
        "\n\t4: #{total_call_duration}"
  end

  private

  def data
    @data.rewind if @data.instance_of?(CSV)
    @data
  end

end