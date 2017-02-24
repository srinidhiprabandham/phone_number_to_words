#!/usr/bin/env ruby
#
require 'set'

#TODO main class that will do the conversion of numbers to meaning full words.
class Converter

  attr_accessor :letters, :word_list

  def initialize
    letters; word_list
  end

  # Hash which we will use to generate the combinations for a given number
  def letters
    @letters ||= {
      "2" => ['a','b','c'],
      "3" => ['d','e','f'],
      "4" => ['g','h','i'],
      "5" => ['j','k','l'],
      "6" => ['m','n','o'],
      "7" => ['p','q','r','s'],
      "8" => ['t','u','v'],
      "9" => ['w','x','y','z']
    }
  end

  # Load the list of words in the dictionary. 
  def word_list
    @word_list ||= Set.new File.read("dictionary.txt").split("\n").map(&:downcase)
  end

  # This take a number and generates all possible combination of words using
  # Cartesian product
  def form_word(number = "567")
    matching = @word_list & Set.new(combination(number.chars))
    p matching.to_a
  end

  def combination(chars_array)
    array_of_letters = chars_array.map do |n|
      @letters[n]
    end

    combination = array_of_letters[1..-1].inject(array_of_letters.first) do |result, value|
      result = result.product(value).map(&:flatten)
    end.map { |s| s.join("") }
  end
end

Converter.new.form_word
