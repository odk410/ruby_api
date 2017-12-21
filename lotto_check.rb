require 'open-uri' #uri까지 오픈할 수 있게 도와주는 것
require 'json'

my_numbers = [*1..45].sample(6).sort

url = "http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo="

page = open(url).read
info = JSON.parse page

# 1.현재 info hash에 있는 값을 아래에 넣는다.
lucky_numbers = []

info.each do |key, value|
  lucky_numbers << value if key.include?('drwtNo')
end

lucky_numbers.sort!
bonus_number = info['bnusNo']

# 2.lucky_numbers, bonus_number를 사용하여 우리가 뽑은 번호와 비교
# 1등 : 6개 숫자가 전부 맞을 경우
# 2등 : 5개가 맞고, 남은 한개가 보너스 번호일 경우
# 3등 : 5개가 맞을 때
# 4등 : 4개가 맞을 때
# 5등 : 3개가 맞을 때
# 나머지 : 꽝


# 두 배열에서 일치하는 것을 뽑아 준다.
match_numbers = lucky_numbers & my_numbers
match_count = match_numbers.count

# if match_count == 6 then puts '1등'
# elsif match_count == 5 && my_numbers.include? bonus_number then puts '2등'
# elsif match_count == 5 then puts '3등'
# elsif match_count == 4 then puts '4등'
# elsif match_count == 3 then puts '5등'
# else then puts '꽝'
# end

result =
    case [match_count, my_numbers.include?(bonus_number)]
    when [6, false] then '1등'
    when [5, true]  then '2등'
    when [5, false] then '3등'
    when [4, false] then '4등'
    when [3, false] then '5등'
    else '꽝~~!!!'
end
p my_numbers
p lucky_numbers
p match_numbers
puts result
