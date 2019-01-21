array = []
[1, 2, 3].each do |elem|
  puts "Коэффициент #{elem}: "
  coefficient = gets.chomp
  raise 'Только числа' unless coefficient =~ /[0-9]/
  array << coefficient.to_f
end
raise 'Первый коэффициент не может равняться нулю' if array.first.zero?
a, b, c = array

discriminant = b**2 - 4 * a * c

def roots(d, a, b)
  roots_list = []
  x1 = (-b + Math.sqrt(d)) / 2 * a
  x2 = (-b - Math.sqrt(d)) / 2 * a
  roots_list << x1 << x2
end

if discriminant < 0
  puts 'Действительных корней нет'
else
  roots(discriminant, a, b).uniq.map { |root| puts root }
end
