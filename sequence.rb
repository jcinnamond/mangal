# Takes an input string and returns single steps or nested sequences
class Sequence
  include Enumerable

  attr_reader :input, :pos, :last

  SEPARATOR = '.'.freeze

  def initialize(input)
    @input = input
    @last = input.size
    @pos = 0
  end

  def each
    while n = self.next
      yield n
    end
  end

  def next
    skip_whitespace
    return nil if pos >= last
    if next_char == '('
      seq = Sequence.new(eat_to_closing)
      skip_whitespace
      skip(SEPARATOR)
      seq
    else
      eat_to(SEPARATOR)
    end
  end

  def eat_to_closing
    @pos += 1 # skip the opening paren
    start = pos
    level = 1
    while level > 0 && pos < last
      level += 1 if next_char == '('
      level -= 1 if next_char == ')'
      @pos += 1
    end
    input[start..pos - 2]
  end

  private

  def eat_to(char)
    start = pos
    @pos += 1 while pos < last && next_char != char
    @pos += 1 # skip the search char or eof
    input[start..pos - 2]
  end

  def skip_whitespace
    skip(' ')
  end

  def skip(char)
    @pos += 1 while pos < last && next_char == char
  end

  def next_char
    input[pos]
  end
end

@s = Sequence.new("wobble . hats . woo")
@d = Sequence.new("(wobble . hats . join (woo . pop), jam)")
@f = Sequence.new("wobble . (hats . woo) . chips")
