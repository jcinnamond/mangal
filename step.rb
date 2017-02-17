# A single step in a command chain
class Step
  attr_reader :cmd, :args, :modules

  def initialize(input, modules)
    cmd, args = input.strip.split(/\s+/, 2)
    @cmd = cmd.strip
    @args = (args || '').strip
    @modules = modules
  end

  def run(previous)
    modules.get(cmd, previous.result, args)
  end
end
