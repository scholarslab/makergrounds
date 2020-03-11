require 'csv'

sites = CSV.read('_data/makergrounds.csv')

#sites.drop(1).each { |tool| puts tool[7].inspect }


CSV.foreach('_data/makergrounds.csv') do |row|
  tools = CSV.parse(row[7], col_sep: ';')
end

