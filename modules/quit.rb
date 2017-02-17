# Exits the application
class Quit < Command
  def report
    puts 'Bye'
    exit
  end
end
