require 'csv'
require 'base64'

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

  def count_called_party_on_dest_decoding_matches(xor_value, search_value)
    data.inject(0) do |count, row|
      (Base64.decode64(row['called-party-on-dest']) ^ xor_value) == search_value ? count + 1: count
    end
  end

  def report
    unique_pairs = call_dest_with_unique_values
    unique_call_dest_values_for_reporting = unique_pairs.keys.sort.map { |ip| "#{ip}=#{unique_pairs[ip]}" }.join('; ')

    'Data Report:' +
        "\n\t1: #{row_count}" +
        "\n\t2: #{call_dest_with_value_count('208.51.154.200')}" +
        "\n\t3: #{unique_call_dest_values_for_reporting}" +
        "\n\t4: #{total_call_duration}" +
        "\n\t5: #{count_called_party_on_dest_decoding_matches('KXGn4NwoBYTtLs3ef1IHk', '00163717708183778')}"
  end

  private

  def data
    @data.rewind if @data.instance_of?(CSV)
    @data
  end

end