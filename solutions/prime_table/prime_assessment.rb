module PrimeAssessment
  def highest_possible_factor
    Math.sqrt(number)
  end
  def remaining_factors_prime?
    for factor in 2..highest_possible_factor
      return false if number % factor == 0 
    end
    true
  end
  def is_prime?(number)
    return false unless number.is_a? Integer
    return true if number < 4
    return false if number.even?
    return false unless remaining_factors_prime?
    true
  end
end