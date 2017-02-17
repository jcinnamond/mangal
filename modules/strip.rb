# Recursive string strip
class Strip < Command
  def result
    strip_list(previous)
  end

  private

  def strip_list(list)
    list.map do |elem|
      if elem.respond_to?(:map)
        strip_list(elem)
      elsif elem.respond_to?(:strip)
        elem.strip
      else
        elem
      end
    end
  end
end
