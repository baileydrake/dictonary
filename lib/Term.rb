class Term
  @@words = []

  def Term.create(term, definition)
    new_term = Term.new(term, definition)
    new_term.save
    new_term
  end

  def Term.words
    @@words
  end

  def Term.search(user_term)
    @@words.select do |object|
      object.term == user_term
    end

  end

  def Term.clear
    @@words = []
  end

  def initialize(term, definition)
    @@words
    @term = term
    @term_list = []
    @term_list << term
    @definition = definition
    @definition_list = []
    @definition_list << definition
  end

  def save
    @@words << Term.new(term, definition)
  end

  def term
    @term
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

  def modify_definition(index, definition)
    @definition_list.delete_at(index.to_i-1)
    @definition_list.insert(index.to_i-1, definition)
  end

  def delete_def(index)
    @definition_list.delete_at(index.to_i-1)
  end

  def delete(index)
    @@words.delete_at(index.to_i-1)
  end

  def add_translation(translation)
    @term_list << translation
  end

  def delete_translation(index)
    @term_list.delete_at(index.to_i-1)
  end

  def modify_translation(index, translation)
    @term_list.delete_at(index.to_i-1)
    @term_list.insert(index.to_i-1, translation)
  end

  def term_list
    @term_list
  end
  # def validate(user_term)
  #  @@words.select do |object|
  #     object.term == user_term
  #   end
  # end
end

