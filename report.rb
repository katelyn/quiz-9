current_file_path = File.expand_path(File.dirname(__FILE__))

require "#{current_file_path}/lib/data_log.rb"
require "#{current_file_path}/lib/ext/string.rb"
require 'csv'

puts DataLog.new(CSV.open("#{current_file_path}/data/quiz1.csv", col_sep: ';', headers: true)).report