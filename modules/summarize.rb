# Turns an array into a count of its elements
class Summarize < Command
  def result
    if previous.is_a?(Hash)
      previous.each_with_object({}) { |(k, v), h| h[k] = v.size }
    else
      previous.each_with_object(Hash.new(0)) { |elem, h| h[elem] += 1 }
    end
  end
end
