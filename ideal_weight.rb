puts 'Ваше имя: '
name = gets.chomp.capitalize!

puts 'Ваш рост: '
height = gets.chomp.to_i

ideal_weight = height - 110

puts "#{name}, ваш #{ideal_weight <= 0 ? 'вес уже оптимальный' : "ваш оптимальный вес #{ideal_weight}"}"
