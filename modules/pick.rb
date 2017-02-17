# Takes keys from a hash and joins the results
class Pick < Command
  def result
    keys = args.split.map(&:strip)
    previous
      .select { |k| keys.include?(k) }
      .values
      .flatten
  end
end
