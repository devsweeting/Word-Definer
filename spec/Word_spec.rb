require ('rspec')
require ('Word')
require ('pry')

describe('Word') do

  before do
    Word.clear
    cat = {:word => "cat", :definition => "a small cat"}
    dog = {:word => "dog", :definition => "a large dog", :definition2 => "that licks butt"}
    @cat = Word.new(cat)
    # @cat.save
    @dog = Word.new(dog)
  end

  describe('#save') do
    it("checks to see if the new ord is saved to @@words correctly") do
      expect(@cat.save()).to(eq([@cat]))
    end
  end

  describe('#all') do
    it("#shows all words in the class Word") do
      Word.clear
      @cat.save
      @dog.save
      expect(Word.all()).to(eq([@cat, @dog]))
    end
  end

  describe('#delete_content') do
    it("#deletes a word from the Class Word") do
      @dog.save
      @cat.save
      expect(Word.delete_content(0)).to(eq([@cat]))
    end
  end

  # describe('#delete_content') do
  #   it("#deletes a word from the Class Word") do
  #     @dog.save
  #     @cat.save
  #     expect(Word.delete_content(0)).to(eq([@cat]))
  #   end
  # end



end
