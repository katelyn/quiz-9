require './lib/data_log.rb'
require './lib/ext/string.rb'
require 'csv'

puts DataLog.new(CSV.open('./data/quiz1.csv', col_sep: ';', headers: true)).report