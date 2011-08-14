require 'ipaddr'

module Faker
  class Internet
    class << self

      def ipv4
        IPAddr.new(rand(2**32),Socket::AF_INET)
      end
      alias :ip :ipv4

      def password(size = 10)
        chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
        (1..size.to_i).to_a.inject("") { |pass,i| pass << chars[rand(chars.size-1)] }
      end

      def email(name = nil)
        [ user_name(name), domain_name ].join('@')
      end
      
      def free_email(name = nil)
        [ user_name(name), %w(gmail.com yahoo.com hotmail.com).rand ].join('@')
      end
      
      def user_name(name = nil)
        return name.scan(/\w+/).shuffle.join(%w(. _).rand).downcase if name
        
        [ 
          Proc.new { Name.first_name.gsub(/\W/, '').downcase },
          Proc.new { 
            [ Name.first_name, Name.last_name ].map {|n| 
              n.gsub(/\W/, '')
            }.join(%w(. _).rand).downcase }
        ].rand.call
      end
      
      def domain_name
        [ domain_word, domain_suffix ].join('.')
      end
      
      def domain_word
        Company.name.split(' ').first.gsub(/\W/, '').downcase
      end
      
      def domain_suffix
        %w(co.uk com us uk ca biz info name).rand
      end
    end
  end
end
