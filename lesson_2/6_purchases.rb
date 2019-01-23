basket = {}

loop do
  puts 'Введите название товара или stop, чтобы выйти:'
  name = gets.chomp
  break if name.eql?('stop')
  puts 'Введите цену за единицу товара:'
  price = gets.to_f
  puts 'Введите кол-во товара:'
  amount = gets.to_i
  basket[name] = { price: price, amount: amount }
end

puts basket
total = 0
basket.each do |product, info|
  sum = info[:price] * info[:amount]
  puts "Вы купили #{product} на сумму #{sum}"
  total += sum
end
puts "Общая сумма: #{total}"
