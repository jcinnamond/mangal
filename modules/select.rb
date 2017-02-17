# Select elements from an array where an attribute matches a value
class Select < Command
  def result
    attr, value = args.split(',').map(&:strip)
    previous.select { |e| e.send(attr).to_s == value }
  end
end
