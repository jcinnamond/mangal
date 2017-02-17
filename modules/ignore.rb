# Ignore differences between pairs
class Ignore < Command
  def result
    pattern = /#{args.split.join('|')}/

    previous.reject do |p|
      words1, words2 = p.map(&:split)
      missing = (words1 - words2).join(' ')
      extra = (words2 - words1).join(' ')

      missing.match(pattern) || extra.match(pattern)
    end
  end
end
