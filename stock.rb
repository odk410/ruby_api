require 'stock_quote'

# companies = ['AAPL', 'FB', 'TSLA', 'GOOGL', 'AMZN']

# DATA는 __END__ 아래있는 데이터를 모두 담고 있다.
DATA.each do |company|
  #.chomp를 써줘야 뒤에 있는 필요 없는 것들이 없어진다.
  company.chomp!
  stock = StockQuote::Stock.quote(company)
  puts stock.name
  puts stock.l
  p company
end

# __END__ 아래는 전부 DATA로 처리
__END__
AAPL
FB
TSLA
GOOGL
AMZN
