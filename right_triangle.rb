array = []
[1, 2, 3].each do |elem|
  puts "Сторона #{elem}: "
  side = gets.chomp.to_i
  raise 'Допускаются только положительные числа' unless side > 0
  array << side
end

a, b, c = array.sort

def isosceles_triangle?(array)
  [1, 2].include?(array.uniq.count)
end

puts 'Треугольник равнобедренный' if isosceles_triangle?(array)
puts 'Треугольник прямоугольный' if a**2 + b**2 == c**2
