puts 'Основание треугольника: '
base = gets.to_f

puts 'Высота треугольника: '
altitude = gets.to_f
unless base.positive? && altitude.positive?
  raise 'Высота и основание должны быть положительными числами'
end

h = 0.5 * base * altitude
puts "Площадь треугольника равнa #{h}"
