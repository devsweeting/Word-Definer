require ('rspec')
require ('Word')
require ('pry')

describe('Word') do

  describe('#all') do
    it("#shows all words in the class Word") do
      word = Word.new()
      expect(Word.all()).to(eq({
        "cat" => "feline",
        "dog" => "canine",
        "koala" => "marsupial",
        "iguana" => "reptile",
        "hawk" => "bird"
      }))
    end
  end

  describe('#add_word') do
    it("#add word to the class Word global hash") do
      word = Word.new()
      word.add_word("puppy", "younglin dog")
      expect(Word.all()).to(eq({
        "cat" => "feline",
        "dog" => "canine",
        "koala" => "marsupial",
        "iguana" => "reptile",
        "hawk" => "bird",
        "puppy" => "younglin dog"
      }))
    end
  end

  describe('#find_definition') do
    it("#find word by key and return definition by value") do
      word = Word.new()
      expect(Word.find_definition("cat")).to(eq("feline"))
    end
  end

end
