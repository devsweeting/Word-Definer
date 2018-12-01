class Word
  attr_accessor(:word, :definition, :id, :definition2)

  @@words = []

  def initialize(attributes)
      @word = attributes.fetch(:word)
      @definition = attributes.fetch(:definition)
      @id = @@words.length
      if attributes.key?(:definition2) == true
        @definition2 = attributes.fetch(:definition2)
      end
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

  def self.clear
    @@words = []
  end

  def self.find(id)
    item_id = id.to_i()
    @@words.each do |item|
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

  def self.add_dictionary
    cat = Word.new({:word => "cat", :definition => "a small domesticated carnivorous mammal with soft fur, a short snout, and retractile claws. It is widely kept as a pet or for catching mice, and many breeds have been developed."})
    cat.save

    dog = Word.new({:word => "dog", :definition => "a domesticated carnivorous mammal that typically has a long snout, an acute sense of smell, and a barking, howling, or whining voice. It is widely kept as a pet or for work or field sports.", :definition2 => "a person regarded as unpleasant, contemptible, or wicked (used as a term of abuse)."})
    dog.save

    lizard = Word.new({:word =>"lizard", :definition =>"a reptile that typically has a long body and tail, four legs, movable eyelids, and a rough, scaly, or spiny skin."})
    lizard.save

    hawk = Word.new({:word =>"hawk", :definition =>"a diurnal bird of prey with broad rounded wings and a long tail, typically taking prey by surprise with a short chase.", :definition2 =>"a person who advocates an aggressive or warlike policy, especially in foreign affairs."})
    hawk.save

    capybara = Word.new({:word =>"capybara", :definition =>"a South American mammal that resembles a giant, long-legged guinea pig. It lives in groups near water and is the largest living rodent.", :definition2 =>"A ruby gem"})
    capybara.save

    wolf = Word.new({:word =>"wolf", :definition =>"a wild carnivorous mammal of the dog family, living and hunting in packs. It is native to both Eurasia and North America, but has been widely exterminated.", :definition2 =>"used in similes and metaphors to refer to a rapacious, ferocious, or voracious person or thing."})
    wolf.save

    badger = Word.new({:word =>"badger", :definition =>"a heavily built omnivorous nocturnal mammal of the weasel family, typically having a gray and black coat.", :definition2 =>"a native of Wisconsin."})
    badger.save

    tester = Word.new({:word =>"test", :definition =>"test"})
    tester.save

    # exword = Word.new({:word =>"", :definition =>"", :definition2 =>""})
    # exword.save
  end

  def check_def2(word)
    if word.key?(:definition2)
      return true
    else
      return false
    end
  end
end


# "koala" => "marsupial",
# "iguana" => "reptile",
# "hawk" => "bird"
