# Groups by some attribute
class Group < Command
  def result
    attr = args.strip.to_sym
    previous.group_by(&attr)
  end
end
