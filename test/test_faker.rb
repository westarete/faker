require File.dirname(__FILE__) + '/test_helper.rb'

class TestFaker < Test::Unit::TestCase

  def setup
  end
  
  def test_numerify
    assert Faker.numerify('###').match(/\d{3}/)
  end


  def test_cc
    assert Faker::Money::TestCards.values.flatten.include?(Faker::Money.test_number)
  end

  def test_money
    assert Faker::Money.currency_string(12..25).to_f < 25
    assert Faker::Money.currency_string(12..25).to_f > 12
  end
end
