require_relative 'module_list'

# Loads new or modified CLI modules
class Loader < Command
  attr_reader :modules, :last_load

  def initialize(_previous, _args)
    @modules = ModuleList.new
    modules.set_cached('reload', self)
    @last_load = []
  end

  def result
    @last_load = []

    Dir.glob(File.expand_path('modules/*.rb', __dir__)).map do |mod|
      name = File.basename(mod, '.rb')
      modified = File.mtime(mod)
      next if modules.load_time(name) >= modified

      class_name = name.capitalize.to_sym
      Object.send(:remove_const, class_name) if Object.constants.include?(class_name)
      Kernel.load mod
      modules.set(name, Object.const_get(class_name), modified)

      last_load << name
    end

    modules
  end

  def memoize?
    true
  end

  def report
    result
    "Loaded: #{last_load}"
  end
end
