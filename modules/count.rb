# Counts the number of elements in an enumerable
class Count < Command
  def result
    previous.count
  end

  def report
    "The count of items is #{result}"
  end
end
