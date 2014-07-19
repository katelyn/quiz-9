class DataLog

  def initialize(array_of_hash_like_data)
    @data = array_of_hash_like_data
  end

  def row_count
    @data.count
  end

end