var expect = chai.expect;

describe('CUSIPStyleLuhnModN', function() {
  describe(".check_digit", function() {
    it("calculates the final check digit", function() {
      expect(CUSIPStyleLuhnModN.checkDigit("ABCDEF")).to.equal(6);
      expect(CUSIPStyleLuhnModN.checkDigit("ABCDEG")).to.equal(4);
      expect(CUSIPStyleLuhnModN.checkDigit("12345")).to.equal(5);
      expect(CUSIPStyleLuhnModN.checkDigit("123455")).to.equal(8);
      expect(CUSIPStyleLuhnModN.checkDigit("A2B1C")).to.equal(5);
      expect(CUSIPStyleLuhnModN.checkDigit("A3B2C")).to.equal(3);
      expect(CUSIPStyleLuhnModN.checkDigit("A1B2C")).to.equal(5);
    });
  });

  describe(".valid?", function() {
    it("returns true/false for valid/invalid string", function() {
      expect(CUSIPStyleLuhnModN.isValid("ABCDEF6")).to.equal(true)

      expect(CUSIPStyleLuhnModN.isValid("ABCDEF5")).to.equal(false)
      expect(CUSIPStyleLuhnModN.isValid("ABCDEF4")).to.equal(false)
      expect(CUSIPStyleLuhnModN.isValid("ABCDEF3")).to.equal(false)
      expect(CUSIPStyleLuhnModN.isValid("ABCDEF2")).to.equal(false)
      expect(CUSIPStyleLuhnModN.isValid("ABCDEF1")).to.equal(false)

      expect(CUSIPStyleLuhnModN.isValid("123455")).to.equal(true)
      expect(CUSIPStyleLuhnModN.isValid("123454")).to.equal(false)

      expect(CUSIPStyleLuhnModN.isValid("A1B2C5")).to.equal(true)
    });
  });
});
