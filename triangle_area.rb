puts 'Основание треугольника: '
base = gets.to_f

puts 'Высота треугольника: '
altitude = gets.to_f

raise 'Высота и основание должны быть положительными числами' unless base.positive? && altitude.positive?

h = 0.5 * base * altitude
puts "Площадь треугольника равнa #{h}"
