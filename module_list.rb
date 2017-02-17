# A container for modules, providing access and caching
class ModuleList
  attr_reader :modules, :cached_modules, :load_times

  def initialize
    @modules = {}
    @cached_modules = {}
    @load_times = {}
    set_cached('modules', self)
  end

  def set(name, klass, load_time = Time.now)
    modules[name] = klass
    load_times[name] = load_time
    cached_modules.delete(name)
  end

  def set_cached(name, obj)
    cached_modules[name] = obj
  end

  def names
    modules.keys.sort.freeze
  end

  def load_time(name)
    @load_times[name] || Time.new(0)
  end

  def get(name, previous = nil, args = nil)
    return cached_modules[name] if cached_modules.key?(name)

    klass = modules[name]
    mod = klass.new(previous, args, self)
    cached_modules[name] = mod if mod.memoize?

    mod
  end

  def result
    names
  end

  def report
    "Cached: #{cached_modules.inspect}\n\nModules: #{modules.inspect}"
  end
end
