describe CusipStyleLuhnModN::CheckDigit do
  describe ".calculate" do
    it "calculates the final check digit" do
      expect(described_class.calculate("ABCDEF")).to eq(6)
      expect(described_class.calculate("ABCDEG")).to eq(4)
      expect(described_class.calculate("12345")).to eq(5)
      expect(described_class.calculate("123455")).to eq(8)
      expect(described_class.calculate("A2B1C")).to eq(5)
      expect(described_class.calculate("A3B2C")).to eq(3)
    end
  end
end
