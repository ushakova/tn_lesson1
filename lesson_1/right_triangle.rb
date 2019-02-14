def isosceles_triangle?(array)
  array.uniq.count < 3
end

sides = []
[1, 2, 3].each do |elem|
  puts "Сторона #{elem}: "
  side = gets.to_i
  raise 'Допускаются только положительные числа' unless side.positive?

  sides << side
end

a, b, c = sides.sort

puts 'Треугольник равнобедренный' if isosceles_triangle?(sides)
puts 'Треугольник прямоугольный' if a**2 + b**2 == c**2
