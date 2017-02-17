require 'ostruct'

# Takes two steps, runs then, then zips the results
class Join < Command
  def result
    bundled_result = OpenStruct.new(result: previous)
    step1, step2 = args.split(',', 2).map { |s| Step.new(s, modules) }
    left = as_array(step1.run(bundled_result).result)
    right = as_array(step2.run(bundled_result).result)
    left.zip(right).map(&:flatten)
  end
end
