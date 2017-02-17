# Prints the output to a file
class Out < Command
  def result
    @file = File.expand_path(args.strip, Dir.getwd)
    File.open(@file, 'w+') { |f| f.print raw }
  end

  def report
    result
    "Saved output to #{@file}"
  end
end
