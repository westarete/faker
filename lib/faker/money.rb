module Faker
  class Money
    TestCards = {
        :american_express => %w(
            378282246310005
            371449635398431
            378734493671000
        ),
                :discover => %w(
            6011111111111117
            6011000990139424
        ),
              :mastercard => %w(
            5555555555554444
            5105105105105100
        ),
                    :visa => %w(
            4111111111111111
            4012888888881881
            4222222222222
        )
    }
     
    class << self

      def number(n)
        n.is_a?(Range) ? n.to_a.rand : rand(n)
      end

      def currency_string(lim = (50..100))
        sprintf("%.2f", "#{number(range)}.#{number(0..100)}".to_f)
      end

      def test_number(issuer = :all)
        return all_cards.sample if issuer && issuer.to_sym == :all
        cards_for(issuer).sample
      end

      def cards_for(issuer)
        issuer = issuer.to_s.downcase.to_sym
        TestCards[issuer] rescue []
      end

      def issuers
        [:visa, :mastercard, :american_express, :discover]
      end

      def all_cards
        issuers.collect { |t| cards_for(t) }.flatten.uniq.compact
      end
      
    end
  end
end
