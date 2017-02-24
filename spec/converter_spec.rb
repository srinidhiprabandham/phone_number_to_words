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

  describe "#combination" do
    it "Should convert a given number to a sequence of characters" do
      expect(Converter.new.combination("567".chars)).to eq ["jmp", "jmq", "jmr",
                                                            "jms", "jnp", "jnq",
                                                            "jnr", "jns", "jop",
                                                            "joq", "jor", "jos",
                                                            "kmp", "kmq", "kmr",
                                                            "kms", "knp", "knq",
                                                            "knr", "kns", "kop", 
                                                            "koq", "kor", "kos",
                                                            "lmp", "lmq", "lmr",
                                                            "lms", "lnp", "lnq",
                                                            "lnr", "lns", "lop",
                                                            "loq", "lor", "los"]
    end
  end

  describe "given input number as - 6686787825" do
    it "should return a combination of matching words" do
      expect(Converter.new.form_words("6686787825")).to eq([["noun", "struck"], 
                                                            ["onto", "struck"], 
                                                            "motortruck", 
                                                            ["motor", "usual"], 
                                                            ["nouns", "truck"], 
                                                            ["nouns", "usual"]])
    end
  end

  describe "given input number as - 2282668687" do
    it "should return a combination of matching words" do
      expect(Converter.new.form_words("2282668687")).to eq([["act", "amounts"], 
                                                            ["act", "contour"], 
                                                            ["bat", "amounts"], 
                                                            ["bat", "contour"], 
                                                            "catamounts", 
                                                            ["cat", "contour"], 
                                                            ["acta", "mounts"]])
    end
  end
end
