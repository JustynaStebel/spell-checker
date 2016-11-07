class WordChecker
require 'set'
require 'csv'

attr_reader :params
  def initialize(params)
    @params = params
  end

  def perform
    doc = DocumentAttachment.find(params[:id])
    text = File.read("public" + doc.file_url)
    dictionary = CSV.read("lib/words.csv")
    checked_words = {}

    text.gsub!(/[!,.\/@\\#$%^&*(){}\[\]`~<>;:\_=+'"]/, '')
    cleaned_text = text.downcase.split

    set_of_words = Set.new(cleaned_text)
    set_of_words.each do |word|
      if dictionary.include?(word)
        checked_words[word]= true
      else
        checked_words[word]= false
      end
    end

    incorrect_word = IncorrectWord.new
    checked_words.each do |key, value|
      incorrect_word.words << key if value == false
    end
    incorrect_word.document_attachment_id = doc.id
    incorrect_word.save!
    incorrect_word
  end
end
