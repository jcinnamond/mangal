class First < Command
  def result
    num = args.to_i
    num = 1 if num == 0
    previous.first(num)
  end
end
