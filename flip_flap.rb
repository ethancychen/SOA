require_relative 'tsv_buddy'
require 'yaml'
# FilpFlap
class FlipFlap
  include TsvBuddy
  def take_yaml(yml)
    @data = YAML.load(yml)
  end

  def to_yaml
    @data.to_yaml
  end
  # Do not create any initializers
end
