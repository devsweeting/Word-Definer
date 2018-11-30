class Word
  attr_accessor(:word, :definition, :id)

  @@words = []
  #
  #  = {
  #   "cat" => "feline",
  #   "dog" => "canine",
  #   "koala" => "marsupial",
  #   "iguana" => "reptile",
  #   "hawk" => "bird"
  # }

  def initialize(attributes)
    @word = attributes.fetch(:word)
    @definition = attributes.fetch(:definition)
    @id = @@words.length
  end

  # def Dictionary
  #   cat = Word.new({@word => "cat", @definition => "feline"})
  #   dog = Word.new({@word => "dog", @definition => "canine"})
  # end



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
end


# "koala" => "marsupial",
# "iguana" => "reptile",
# "hawk" => "bird"

# <ul>
#   <% if @list.kind_of?(Array) %>
#     <% @list.each do |each| %>
#       <p id='<%= each.id %>'><a href='/output/<%= each.id %>'><%= each.name %></a></p>
#     <% end %>
#   <% else %>
#     <p id='<%= @list.id %>'><a href='/output/<%= @list.id %>'><%= @list.name %></a></p>
#   <% end %>
# </ul>
