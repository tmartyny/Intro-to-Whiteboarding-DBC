class PrimeNum
  attr_reader :number
  def initialize(args)
    @number = args.fetch(:number, 0)
  end
  # if they are larger than the sqrt of number, they are redundant
  def highest_possible_factor
    Math.sqrt(number)
  end
  def less_than_two?
    number < 2
  end
  def less_than_four?
    number < 4
  end
  def remaining_factors_prime?
    for factor in 2..highest_possible_factor
      return false if number%factor == 0 
    end
    true
  end
  def is_prime?
    return false unless number.is_a? Integer
    return false if less_than_two?
    return true if less_than_four?
    return false if number.even? 
    return false unless remaining_factors_prime?
    true
  end
end