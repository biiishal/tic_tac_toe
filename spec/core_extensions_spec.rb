require "spec_helper"

describe Array do
  context "#all_empty?" do
    it "returns true if all elements of an array are empty" do
      expect(["", "", ""].all_empty?).to be_truthy
    end

    it "returns false if some elements are not empty" do
      expect(["", "a", "", Object.new].all_empty?).to be_falsey
    end

    it "returns true if the array is empty" do
      expect([].all_empty?).to be_truthy
    end
  end

  context "#all_same?" do
    it "returns true if all elements of an array are same" do
      expect(["a", "a", "a"].all_same?).to be_truthy
    end

    it "returns false if any elemnt is different" do
      expect(["a", "a", "b"].all_same?).to be_falsey
    end

    it "returns true if the array is empty" do
      expect([].all_same?).to be_truthy
    end
  end

  context "#any_empty?" do
    it "returns true if any element in an array is empty" do
      expect(["", "a", "b"].any_empty?).to be_truthy
    end

    it "returns false if no element in array is empty" do
      expect(["a", "a.", "b"].any_empty?).to be_falsey
    end
  end

  context "#none_empty?" do
    it "returns true if no element in array is empty" do
      expect(["a", "b", "c"].none_empty?).to be_truthy
    end

    it "returns false if some element in array is not empty" do
      expect([Object.new, "", ["array"]].none_empty?).to be_falsey
    end
  end

end