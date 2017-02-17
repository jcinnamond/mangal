require 'csv'

# Converts an array of arrays into a csv
class Csv < Command
  attr_reader :name

  def result
    headers = args.split(',').map(&:strip)
    CSV.generate do |csv|
      csv << headers unless headers.empty?
      previous.each do |row|
        csv << row
      end
    end
  end
end
