module Luhn

  class << self

    def verify(card_number)
      luhn_check(card_number).zero?
    end

    def break_digits(card_number)
      card_number.to_s.split(//).map(&:to_i)
    end

    def double_value(card_number)
      number = break_digits(card_number)
      number.reverse.map.with_index do |n, i|
        if i.odd?
            t = n*2 
            t > 9 ? break_digits(t).inject(:+) : t
          else
            n
        end
      end
    end

    def sum_digits(card_number)
      double_value(card_number).inject(&:+)
    end

    def luhn_check(card_number)
      sum_digits(card_number) % 10
    end
  end
end

Luhn.verify(4194560385008504)
puts Luhn.verify(4194560385008504)
puts Luhn.verify(4194560385008505)
puts Luhn.verify(377681478627336)
puts Luhn.verify(377681478627337)