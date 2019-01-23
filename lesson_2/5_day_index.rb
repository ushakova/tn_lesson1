MONTHS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31].freeze

def leap_year?(year)
  (year % 4).zero? && (year % 100 != 0 || (year % 400).zero?)
end

def count_days(day, month, year)
  counter = 0
  counter += 1 if leap_year?(year) && (month > 2)
  MONTHS.each_with_index do |days, index|
    if index + 1 == month
      counter += day
      break
    end
    counter += days
  end
  counter
end

puts 'Укажите число:'
day = gets.to_i
raise 'Не более 31 дня и не менее 1' if day > 31 || day < 1
puts 'Укажите месяц:'
month = gets.to_i
raise 'Не более 12 месяцев и не менее 1' if month > 12 || month < 1
raise 'Указанное кол-ва дней в месяце больше максимального' if (MONTHS[month - 1] < day) && !(month == 2 && day < 30)
puts 'Укажите год:'
year = gets.to_i
puts count_days(day, month, year)
