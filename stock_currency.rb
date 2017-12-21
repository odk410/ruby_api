require 'stock_quote'
require 'eu_central_bank'

@bank = EuCentralBank.new

def used_to_krw(volume)
  @bank.update_rates
  @bank.exchange(100, 'USD', 'KRW').to_f * volume.to_f.round
end

# DATA.each do |company|
#   #.chomp를 써줘야 뒤에 있는 필요 없는 것들이 없어진다.
#   company.chomp!
#   stock = StockQuote::Stock.quote(company)
#   puts "#{stock.name}의 가격은 $#{stock.l} (￦#{used_to_krw(stock.l)})"
# end

# git bash에서 주식을 확인하고 싶은 회사를 입력하면 볼 수 있게 해주는 방법
# 창에서  ruby stock_currency.rb  FB TSLA 로 입력하면 된다.
ARGV.each do |company|
  stock = StockQuote::Stock.quote(company)
  puts "#{stock.name}의 가격은 $#{stock.l} (￦#{used_to_krw(stock.l).round(1)})"
end

# __END__ 아래는 전부 DATA로 처리
__END__
AAPL
FB
TSLA
GOOGL
AMZN
