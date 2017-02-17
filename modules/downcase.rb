# Recursive downcase
class Downcase < Command
  def result
    downcase_list(previous)
  end

  private

  def downcase_list(list)
    list.map do |elem|
      if elem.respond_to?(:map)
        downcase_list(elem)
      elsif elem.respond_to?(:downcase)
        elem.downcase
      else
        elem
      end
    end
  end
end
