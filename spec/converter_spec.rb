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
end
