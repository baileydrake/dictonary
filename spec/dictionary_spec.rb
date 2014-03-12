require 'rspec'
require 'Term'

describe Term do
  before do
    Term.clear
  end
  it 'creates an instance of term with a word and a definition' do
    new_term = Term.new('cat', 'an animal')
    new_term.should be_an_instance_of Term
  end
  it 'shows the term' do
    new_term = Term.new('cat', 'an animal')
    new_term.term.should eq 'cat'
  end
  it 'shows the definition' do
    new_term = Term.new('cat', 'an animal')
    new_term.definition.should eq 'an animal'
  end
  it 'saves a word' do
    new_term = Term.create('cow', 'a large animal')
    Term.words[0].term.should eq 'cow'
  end
  it 'modifies a definition' do
    new_term = Term.create('bat', 'a clobbering device')
    new_term.modify_definition(1, 'an animal')
    new_term.definition_list[0].should eq 'an animal'
  end
  it 'deletes a selected word' do
    new_term = Term.create('cow', 'a spotted animal')
    new_term.delete(1)
    Term.words.should eq []
  end
  it 'adds definitions into the definition array' do
    new_term = Term.create('cow', 'a big animal')
    new_term.definition_create
    new_term.definition_list[0].should eq 'a big animal'
  end

  describe '.create' do
    it 'should treate a term object' do
    new_term = Term.create('plane', 'a metal bird')
    new_term.should be_an_instance_of Term
    end
  end
end
