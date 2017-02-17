# Finds mismatched pairs in an array
class Differences < Command
  def result
    previous.select do |p|
      p[0] != p[1]
    end
  end
end
