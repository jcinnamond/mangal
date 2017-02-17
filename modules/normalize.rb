# Removes non alpha characters
class Normalize < Command
  def result
    normalize_list(previous)
  end

  private

  def normalize_list(list)
    list.map do |elem|
      if elem.respond_to?(:map)
        normalize_list(elem)
      else
        elem.gsub('&', 'and').tr('-', ' ').gsub(/\s+/, ' ').strip
      end
    end
  end
end
