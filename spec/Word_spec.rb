# require ('rspec')
# require ('Word')
# require ('pry')
#
# describe('Word') do
#
#   before do
#     Word.clear
#     cat = {:word => "cat", :definition => "a small cat"}
#     dog = {:word => "dog", :definition => "a large dog", :definition2 => "that licks butt"}
#     @cat = Word.new(cat)
#     # @cat.save
#     @dog = Word.new(dog)
#   end
#
#   describe('#save') do
#     it("checks to see if the new ord is saved to @@words correctly") do
#       expect(@cat.save()).to(eq([@cat]))
#     end
#   end
#
#   describe('#all') do
#     it("#shows all words in the class Word") do
#       Word.clear
#       @cat.save
#       @dog.save
#       expect(Word.all()).to(eq([@cat, @dog]))
#     end
#   end
#
#   describe('#delete_content') do
#     it("#deletes a word from the Class Word") do
#       @dog.save
#       @cat.save
#       expect(Word.delete_content(0)).to(eq([@cat]))
#     end
#   end
#
#
#   describe("#find") do
#    it("returns a word based on its ID") do
#    Word.clear
#    cat = Word.new({:word => "cat", :definition => "a small domesticated carnivorous mammal with soft fur, a short snout, and retractile claws. It is widely kept as a pet or for catching mice, and many breeds have been developed."})
#    cat.save
#    dog = Word.new({:word => "dog", :definition => "a domesticated carnivorous mammal that typically has a long snout, an acute sense of smell, and a barking, howling, or whining voice. It is widely kept as a pet or for work or field sports.", :definition2 => "a person regarded as unpleasant, contemptible, or wicked (used as a term of abuse)."})
#    dog.save
#    lizard = Word.new({:word =>"lizard", :definition =>"a reptile that typically has a long body and tail, four legs, movable eyelids, and a rough, scaly, or spiny skin."})
#    lizard.save
#    expect(Word.find(2)).to(eq(dog))
#    end
#  end
#
#    describe("#edit_def") do
#     it("edits the existing definition of a previously saved word") do
#     Word.clear
#     cat = Word.new({:word => "cat", :definition => "a small domesticated carnivorous mammal with soft fur, a short snout, and retractile claws. It is widely kept as a pet or for catching mice, and many breeds have been developed."})
#     cat.save
#     cat.edit_def("This is a test")
#     expect(cat.definition).to eq ("This is a test")
#     end
#   end
#
#   describe("#add_def") do
#   it("adds new definition to the array of definitions for the object Word") do
#     Word.clear
#     cat = Word.new({:word => "cat", :definition => "a small domesticated animal"})
#     cat.save
#     cat.add_def("This is a test")
#     expect(cat.definition).to eq (["a small domesticated animal","This is a test"])
#     end
#   end
#
#   # describe('#delete_content') do
#   #   it("#deletes a word from the Class Word") do
#   #     @dog.save
#   #     @cat.save
#   #     expect(Word.delete_content(0)).to(eq([@cat]))
#   #   end
#   # end
#
#
#
# end
