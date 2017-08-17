class ValidateCard

  #reads original card number and initially assumes card is invalid and has not been checked
  def initialize(original_card_number, valid = false, verify_validation = false)
    @original_card_number = original_card_number
    @valid = valid
    @verify_validation = verify_validation
  end

  #runner method that executes Luhn Algorithm and return's result
  def perform_validation
    #reformat and double each digit of the original card number
    reversed_num = reverse_card_num()
    doubled_reversed_num = double_every_other_digit(reversed_num)

    #sum digits and verifies the sum is divisible by 10
    sum_of_digits = sum_digits(doubled_reversed_num)
    @valid = divisible_by_10?(sum_of_digits)

    #proof that valdiation was performed
    @verify_validation = true
  end

  #reverses card number
  def reverse_card_num()
    @original_card_number.chars.reverse
  end

  #iterates through an array, performs computations on odd indeces, and returns output
  def double_every_other_digit(card_num)
    card_num.each_with_index do |num,index|
      if index.odd?
          card_num[index] = double_a_digit_string(num)
          card_num[index] = convert_to_single_digit(card_num[index])
      end
    end
    return card_num
  end

  #doubles a digit and returns a string
  def double_a_digit_string(num)
    num = (num.to_i * 2).to_s
  end

  #if a number has more than one digit, adds its digits together and returns result as string
  def convert_to_single_digit(num)
    if num.to_i > 9
      total = 0
      individual_digit = num.to_s.chars
      individual_digit.each { |num| total += num.to_i }
      return total.to_s
    else
      return num.to_s
    end
  end

  #iterates through an array of digits to find (and return) the sum of its elements
  def sum_digits(card_num)
    total = 0
    card_num.each { |num| total += num.to_i }
    return total
  end

  #checks a number's divisibility by 10 and returns boolean
  def divisible_by_10?(num)
    if num % 10 == 0 then true else false end
  end

  #verifies that the validation was checked and prints results
  def print_validation_status
    if !@verify_validation
      puts "The number #{@original_card_number} has yet to be checked!"
    elsif @valid
      puts "The number #{@original_card_number} is valid!"
    else
      puts "The number #{@original_card_number} is invalid!"
    end
  end

end
