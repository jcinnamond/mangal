require 'pp'

# Pretty print results
class Pp < Command
  def result
    previous
  end

  def report
    pp result
    ''
  end
end
