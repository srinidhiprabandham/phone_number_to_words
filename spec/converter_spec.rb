require_relative '../converter.rb'

#This will do the testing of our convert class.
#
#
describe Converter do
  describe "#word_list" do
    it "Should load a list of all words in the dictionary" do
      expect(Converter.new.word_list).not_to be []
    end
  end

  describe "#numbers to chars - hash_map" do
    it "Should contain a list of numbers between 2 and 9" do
      expect(Converter.new.letters.keys).to eq ["2", "3", "4", "5", "6", "7", "8", "9"]
    end

    it "Should contain the correct sequence for a given number" do
      expect(Converter.new.letters["2"]).to eq ["a", "b", "c"]
    end
  end

  describe "#number to word" do
    it "Should convert a given number to a sequence of characters" do
      expect(Converter.new.form_word("567")).to eq [["j", "m", "p"], ["j", "m", "q"], ["j", "m", "r"], ["j", "m", "s"], ["j", "n", "p"], ["j", "n", "q"], ["j", "n", "r"], ["j", "n", "s"], ["j", "o", "p"], ["j", "o", "q"], ["j", "o", "r"], ["j", "o", "s"], ["k", "m", "p"], ["k", "m", "q"], ["k", "m", "r"], ["k", "m", "s"], ["k", "n", "p"], ["k", "n", "q"], ["k", "n", "r"], ["k", "n", "s"], ["k", "o", "p"], ["k", "o", "q"], ["k", "o", "r"], ["k", "o", "s"], ["l", "m", "p"], ["l", "m", "q"], ["l", "m", "r"], ["l", "m", "s"], ["l", "n", "p"], ["l", "n", "q"], ["l", "n", "r"], ["l", "n", "s"], ["l", "o", "p"], ["l", "o", "q"], ["l", "o", "r"], ["l", "o", "s"]]
    end
  end
end
