require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definition')
require('./lib/word')
require('pry')

get('/') do
  erb(:index)
end

get('/word/new') do
  erb(:word_form)
end

get('/words') do
  @words = Word.all()
  erb(:words)
end

post('/words') do
  word = params.fetch('word')
  Word.new(word).save()
  @word = Word.all()
  erb(:success)
end

get('/definitions/:id') do
  @definition = Definition.find(params.fetch('id'))
  erb(:definition)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/words/:id/definitions') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:definitions)
end










get('/definition_form/:id/definitions/new') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:definition_form)
end

post('/words/:id/definitions') do
  meaning = params.fetch('meaning')
  speech = params.fetch('speech')
  origin = params.fetch('origin')
  @definition = Definition.new(meaning, speech, origin)
  @definition.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(@definition)
  erb(:success)
end
