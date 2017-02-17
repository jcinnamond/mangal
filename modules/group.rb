# Takes pairs of strings and groups them by differences
class Group < Command
  def result
    previous.group_by do |p|
      words1, words2 = p.map(&:split)
      missing = words1 - words2
      extra = words2 - words1
      [missing, extra]
    end
  end

  def report
    result.map do |k, v|
      "#{k}: #{v.count}"
    end
  end
end
