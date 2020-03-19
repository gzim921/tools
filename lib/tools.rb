require "tools/version"

module Tools
  class Luhn
    def initialize(str)
      @str = str
    end

    def valid?
      return false if @str.length <= 1
      return false if @str.chars.any? { |chars| ('a'..'z').include? chars.downcase}
      return false if @str.length == 2 && @str[0] == ' ' && @str[1] == '0'
      return false if !@str.scan(/[!$&#-]/).empty? || @str.include?(':')
      return false if luhn_valid? == false
      true
    end

    def luhn_valid?
      stripped = @str.delete(' ')
      reversed_strip = stripped.reverse
      reversed_array = reversed_strip.chars
      every_first_r = (0..reversed_array.length-1).step(2)
      every_second_r = (1..reversed_array.length-1).step(2)
      every_first_ar = every_first_r.map { |i| reversed_array[i] }
      ever_second_ar = every_second_r.map { |i| reversed_array[i] }
      string_to_integer1 = every_first_ar.map { |i| i.to_i }
      string_to_integer2 = every_second_r.map { |i| i.to_i }
      multiply = string_to_integer2.map { |i| ((i * 2)-9 if i <= 5) || i * 2 }
      sum_all_int = multiply + string_to_integer1
      sum_all = sum_all_int.sum
      return true if sum_all % 10 == 0
      false
    end

    class Raindrop
  end
end
