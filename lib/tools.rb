require "tools/version"

module Tools
  class Luhn
    def initialize(str)
      @str = str
    end

    def valid?
      false
    end

    def invalid?
      !valid?
    end
  end
end
