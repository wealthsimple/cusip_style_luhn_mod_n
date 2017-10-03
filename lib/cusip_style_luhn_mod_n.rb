require "cusip_style_luhn_mod_n/version"

module CUSIPStyleLuhnModN
  def self.valid?(str)
    str[-1] == check_digit(str[0...-1]).to_s
  end

  def self.check_digit(s)
    total = 0
    s.split('').reverse.each_with_index do |c, i|
      value = character_value(c)
      multiplier = (i % 2).zero? ? 2 : 1
      sum_of_digits = digits(value * multiplier).reduce(:+)
      total += sum_of_digits
    end
    total %= 10
    total.zero? ? 0 : 10 - total
  end

  def self.character_value(c)
    value = c.ord - '0'.ord
    return value if value >= 0 && value <= 9
    value = c.downcase.ord - 'a'.ord + 10
    return value if value >= 0 && value <= 35
    raise "Illegal character: #{c}"
  end

  def self.digits(n)
    digits = []
    return [0] if n.zero?
    while n != 0
      n, last_digit = n.divmod(10)
      digits << last_digit
    end
    digits.reverse
  end
end
