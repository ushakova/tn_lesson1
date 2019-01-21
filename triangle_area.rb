puts 'Основание треугольника: '
base = gets.chomp.to_i

puts 'Высота треугольника: '
altitude = gets.chomp.to_i

raise 'Высота и основание должны быть положительными числами' unless base > 0 && altitude > 0

h = 0.5 * base * altitude
puts "Площадь треугольника равнa #{h}"
