class Word
  attr_accessor(:word, :definition)

  @@words = {
    "Cat" => "feline",
    "Dog" => "canine",
    "koala" => "marsupial",
    "iguana" => "reptile",
    "hawk" => "bird"
  }

  def initialize(atttributes)
    @word = attributes.fetch(:word)
    @definition = attributes.fetch(:definition)
    @id = @@words.length
  end


  def self.all
    @@words
  end

  def save
   @@words.push(self)
  end

  def add_word (word, definition)
    @@words.store(word, definition)
  end

  def self.find_definition(word)
    @@words.fetch(word)
  end

  def self.find(id)
    item_id = id.to_i()
    @@cats.each do |item|
      if item.id == item_id
        return item
      end
    end
  end

  def self.reassign_ids
    if (@@words != [])
      @@words.each_with_index do |word, i|
        word.id = i
      end
    end
  end

  def self.delete_content(id)
   @@words.delete_at(id)
   self.reassign_ids
 end
end
