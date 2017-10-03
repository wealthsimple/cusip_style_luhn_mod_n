(function(global) {
  var CUSIPStyleLuhnModN = {};

  CUSIPStyleLuhnModN.isValid = function(str) {
    return str.slice(-1) === CUSIPStyleLuhnModN.checkDigit(str.slice(0, -1)).toString();
  };

  CUSIPStyleLuhnModN.checkDigit = function(s) {
    var total = 0;
    s.split("").reverse().forEach(function (c, i) {
      var value = characterValue(c);
      var multiplier = (i % 2 === 0) ? 2 : 1;
      total += digits(value * multiplier).reduce(function (prev, current) {
          return prev + current;
      }, 0);
    });
    total %= 10;
    return total === 0 ? 0 : 10 - total;
  };

  function characterValue(c) {
    var value = c.toLowerCase().charCodeAt(0);
    var digitValue = value - "0".charCodeAt(0);
    if (digitValue >= 0 && digitValue <= 9) {
      return digitValue;
    }
    var letterValue = value - "a".charCodeAt(0);
    if (letterValue >= 0 && letterValue <= 35) {
      return letterValue + 10;
    }
    throw "Illegal character: " + c;
  };

  function digits(n) {
    if (n === 0) {
      return [0];
    }
    var digits = [];
    while (n !== 0) {
      digits.unshift(n % 10);
      n = (n / 10 >> 0);
    }
    return digits;
  }

  if (typeof exports !== 'undefined') {
    if (typeof module !== 'undefined' && module.exports) {
      exports = module.exports = CUSIPStyleLuhnModN;
    }
    exports.CUSIPStyleLuhnModN = CUSIPStyleLuhnModN;
  }
  else {
    global.CUSIPStyleLuhnModN = CUSIPStyleLuhnModN;
  }
})(this);
