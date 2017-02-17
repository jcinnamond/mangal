# Turns an array into a count of its elements
class Summarize < Command
  def result
    previous.each_with_object(Hash.new(0)) { |elem, h| h[elem] += 1 }
  end
end
