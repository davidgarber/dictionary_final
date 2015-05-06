class Definition
  @@definition = []

  define_method(:initialize) do |meaning, speech, origin|
    @meaning = meaning
    @speech = speech
    @origin = origin
    @id = @@definition.length().+(1)
  end

  define_method(:meaning) do
    @meaning
  end

  define_method(:speech) do
    @speech
  end

  define_method(:origin) do
    @origin
  end

  define_singleton_method(:all) do
    @@definition
  end

  define_method(:save) do
    @@definition.push(self)
  end

  define_singleton_method(:clear) do
    @@definition = []
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |identification|
    found_word = nil
    @@definition.each() do |word|
      if word.id().eql?(identification.to_i())
        found_word = word
      end
    end
    found_word
  end
end
