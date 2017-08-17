require "./credit_check.rb"

all_cards = [
  given_card_number = ValidateCard.new("4929735477250543"),
  valid_card_1 = ValidateCard.new("5541808923795240"),
  valid_card_2 = ValidateCard.new("4024007136512380"),
  valid_card_3 = ValidateCard.new("6011797668867828"),
  valid_amex_card = ValidateCard.new("342804633855673"),
  invalid_card_1 = ValidateCard.new("5541801923795240"),
  invalid_card_2 = ValidateCard.new("4024007106512380"),
  invalid_card_3 = ValidateCard.new("6011797668868728"),
  invalid_amex_card = ValidateCard.new("342801633855673")
]

def perform_validations(cards)
  cards.each { |card| card.perform_validation}
end

def print_results(cards)
  cards.each { |card| card.print_validation_status}
end

perform_validations(all_cards)
print_results(all_cards)
