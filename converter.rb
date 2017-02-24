#!/usr/bin/env ruby
#
require 'set'

#TODO main class that will do the conversion of numbers to meaning full words.
class Converter

  attr_accessor :letters, :word_list

  def initialize
    letters; word_list
    get_input
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

  def get_input
    puts "Please enter the 10 digit number :"
    form_words gets.chomp
  end

  # Load the list of words in the dictionary. 
  def word_list
    @word_list ||= Set.new File.read("dictionary.txt").split("\n").map(&:downcase)
  end

  def form_words(number = "6686787825")
    matrix = split_into_sequences(number).map do |a, b|
      words_for_a = @word_list & Set.new(combination(a.chars))
      words_for_b = @word_list & Set.new(combination(b.chars))
      words_for_a.to_a.product words_for_b.to_a
    end.reject(&:empty?)

    combination_word_list = []
    matrix.flatten.each_slice(2) { |comb| combination_word_list.push(comb) }

    final_word = (@word_list & Set.new(combination(number.chars))).first

    combination_word_list.map! do |array|
      if array.join("") == final_word
        final_word
      else
        array
      end
    end

    puts combination_word_list.inspect
    combination_word_list
  end

  def split_into_sequences(number)
    [
      [number[0..2], number[3..-1]],
      [number[0..3], number[4..-1]],
      [number[0..4], number[5..-1]],
      [number[0..5], number[6..-1]],
      [number[0..6], number[7..-1]]
    ]
  end

  # This take a number and generates all possible combination of words using
  # Cartesian product
  def combination(chars_array)
    array_of_letters = chars_array.map { |digit| @letters[digit] }
    combination = array_of_letters.shift.product(*array_of_letters).map(&:join)
  end
end

Converter.new
