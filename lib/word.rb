class Word
  @@word = []

  define_method(:initialize) do |entry|
    @entry = entry
    @id = @@word.length().+(1)
    @definitions = []
  end

  define_method(:entry) do
    @entry
  end

  define_singleton_method(:all) do
    @@word
  end

  define_method(:save) do
    @@word.push(self)
  end

  define_singleton_method(:clear) do
    @@word = []
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |id|
    found_name = nil
    @@word.each() do |name|
      if name.id().eql?(id.to_i())
        found_name = name
      end
    end
    found_name
  end

  define_method(:definitions) do
    @definitions
  end

  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end
end
