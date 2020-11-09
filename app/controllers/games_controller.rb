require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    raise
    @word = params[:word]
    url_read = open("https://wagon-dictionary.herokuapp.com/#{@word}").read
    validation = JSON.parse(url_read)
    if validation['found'] == false
      @response = 'Not an English word'
      @score = 0
    elsif @word.chars.any? { |char| @word.chars.count(char) > params[:letters].count(char.upcase) }
      @response = " #{@word} is not in the grid"
      @score = 0
    else
      @response = 'Great!'
      @score = @word.length
    end
  end
end
