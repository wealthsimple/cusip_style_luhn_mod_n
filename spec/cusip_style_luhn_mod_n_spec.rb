describe CUSIPStyleLuhnModN do
  it "has a version number" do
    expect(described_class::VERSION).not_to be nil
  end

  describe ".check_digit" do
    it "calculates the final check digit" do
      expect(described_class.check_digit("ABCDEF")).to eq(6)
      expect(described_class.check_digit("ABCDEG")).to eq(4)
      expect(described_class.check_digit("12345")).to eq(5)
      expect(described_class.check_digit("123455")).to eq(8)
      expect(described_class.check_digit("A2B1C")).to eq(5)
      expect(described_class.check_digit("A3B2C")).to eq(3)
      expect(described_class.check_digit("A1B2C")).to eq(5)
    end
  end

  describe ".valid?" do
    it "returns true/false for valid/invalid string" do
      expect(described_class.valid?("ABCDEF6")).to be(true)

      expect(described_class.valid?("ABCDEF5")).to be(false)
      expect(described_class.valid?("ABCDEF4")).to be(false)
      expect(described_class.valid?("ABCDEF3")).to be(false)
      expect(described_class.valid?("ABCDEF2")).to be(false)
      expect(described_class.valid?("ABCDEF1")).to be(false)

      expect(described_class.valid?("123455")).to be(true)
      expect(described_class.valid?("123454")).to be(false)

      expect(described_class.valid?("A1B2C5")).to be(true)
    end
  end
end
