# Superclass for all CLI commands
class Command
  attr_reader :previous, :args, :modules

  def initialize(previous, args, modules)
    @previous = as_array(previous)
    @args = args
    @modules = modules
  end

  def as_array(v)
    if v.is_a?(ActiveRecord::Associations::CollectionProxy)
      v.to_a
    elsif v.respond_to?(:each)
      v
    elsif v.respond_to?(:to_a)
      v.to_a
    else
      [v]
    end
  end

  def memoize?
    false
  end

  def result
    nil
  end

  def report
    result.inspect
  end
end
