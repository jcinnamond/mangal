require 'csv'

# Converts an array of arrays into a csv
class Csv < Command
  attr_reader :name

  def result
    basename, *headers = args.split(',').map(&:strip)
    basename ||= 'out'
    @name = "#{basename}.csv"
    CSV.open(name, 'wb') do |csv|
      csv << headers unless headers.empty?
      previous.each do |row|
        csv << row
      end
    end
  end

  def report
    result
    "Wrote CSV to #{name}"
  end
end
