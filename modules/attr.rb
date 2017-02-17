# Takes a chain of attr names and grabs them from the input
class Attr < Command
  def result
    attrs = args.split('>').map(&:strip).map(&:to_sym)
    result = attrs.inject(previous) do |acc, attr|
      acc.map do |item|
        v = item.send(attr)
        v = v.to_a if v.respond_to?(:to_a)
        v = v.first if v.is_a?(Array)
        v
      end
    end
  end
end
