require 'open-uri'
require 'json'

class PagesController < ApplicationController
  def home
    @letters = ('a'..'z').to_a
    @selection = []
    n = 0
    while n < 10
      @selection << @letters.sample
      n += 1
    end
  end
  def english_word
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    word_dictionary = URI.open(url).read

    word = JSON.parse(word_dictionary)
    return word['found']
  end

  def score
    @answer = params[:answer]
    if english_word == true
       @result = "Congratulations! #{@answer} is a valid English word."
    else
       @result = "#{@answer} is not valid."
    end
  end
end
