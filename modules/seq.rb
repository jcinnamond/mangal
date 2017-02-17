require 'ostruct'

# Creates a sequence of steps to be used with join
class Seq < Command
  def result
    bundled_result = OpenStruct.new(result: previous)
    steps = args.strip.split(';').map { |s| Step.new(s, modules) }
    steps
      .inject(bundled_result) { |previous, step| step.run(previous.result) }
      .result
  end
end
