require 'readline'
require_relative 'command'
require_relative 'step'
require_relative 'loader'

class Runner
  attr_reader :modules

  def initialize
    loader = Loader.new(nil, nil)
    @modules = loader.result
    Readline.completion_proc = ->(s) { modules.names.grep(/^#{Regexp.escape(s)}/) }
  end

  def run
    while input = Readline.readline('> ', true)
      exit if input.nil?
      begin
        null = modules.get('null')
        steps = input.split('>').map { |step| Step.new(step, modules) }
        final = steps.inject(null) do |previous, step|
          step.run(previous)
        end
        puts final.report
      rescue StandardError => e
        puts "! #{e.message}"
        puts modules.get('pp', e.backtrace).report
      end
    end
  end
end

Runner.new.run
