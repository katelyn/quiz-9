class DataLog

  def initialize(array_of_hash_like_data)
    @data = array_of_hash_like_data
  end

  def row_count
    @data.count
  end

  def call_dest_with_value_count(search_value)
    @data.inject(0) { |count, row| row['call-dest'] == search_value ? count + 1 : count }
  end

end