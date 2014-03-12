class Definition
  def initialize(definition)
    @definition = definition
    @definition_list = []
    @definition_list << definition
  end

 def definition
    @definition
  end

  def definition_list
    @definition_list
  end

  def add_definition(definition)
    @definition_list << definition
  end
end
