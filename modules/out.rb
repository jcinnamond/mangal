# Prints the output to a file
class Out < Command
  def result
    name, force = args.split(',').map(&:strip)
    @file = File.expand_path(name, Dir.getwd)
    flags = File::WRONLY | File::CREAT
    flags |= File::EXCL unless force.to_s == 'f'
    File.open(@file, flags) { |f| f.print raw }
    previous
  end

  def report
    result
    "Saved output to #{@file}"
  end
end
