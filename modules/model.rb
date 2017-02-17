# Loads data from a rails model
class Model < Command
  def result
    args.classify.constantize.all
  end
end
