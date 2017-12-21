require 'eu_central_bank'

@bank = EuCentralBank.new
# bank.update_rates

# from = 'USD'
# to = 'KRW'
#
# result = bank.exchange(100,from, to)
# puts "#{from} => #{to} : 1$ => #{result}원 입니다."

def exchange(from)
  @bank.update_rates
  @bank.exchange(100, from, 'KRW')
end

puts "1$ => #{exchange('USD')}원 입니다."
