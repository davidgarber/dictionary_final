require('rspec')
require('definition')


describe(Definition) do
  before() do
    Definition.clear()
  end

  describe("#meaning") do
    it("returns the meaning of a word") do
      test_definition = Definition.new("significance of a word", "noun", "latin")
      test_definition.save()
      expect(test_definition.meaning()).to(eq("significance of a word"))
    end
  end

  describe("#speech") do
    it("returns the part of speech of the word") do
      test_definition = Definition.new("significance of a word", "noun", "latin")
      test_definition.save()
      expect(test_definition.speech()).to(eq("noun"))
    end
  end

  describe("#origin") do
    it("returns the origin of the word") do
      test_definition = Definition.new("significance of a word", "word", "latin")
      test_definition.save()
      expect(test_definition.origin()).to(eq("latin"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves the definition") do
      test_definition = Definition.new("significance of a word", "word", "latin")
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved definitions") do
      Definition.new("significance of a word", "noun", "latin").save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

   describe("#id") do
     it("returns the id of the definition") do
       test_definition = Definition.new("significance of a word", "noun", "latin")
       test_definition.save()
       expect(test_definition.id()).to(eq(1))
     end
   end

   describe(".find") do
     it("returns a definition by its id number") do
       test_definition = Definition.new("significance of a word", "noun", "latin")
       test_definition.save()
       test_definition2 = Definition.new("to move quickly", "verb", "French")
       test_definition2.save()
       expect(Definition.find(test_definition.id())).to(eq(test_definition))
     end
   end
end
