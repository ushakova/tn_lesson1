def roots(d, a, b)
  roots_list = []
  roots_list << (-b + Math.sqrt(d)) / 2 * a
  return roots_list if d.zero?
  roots_list << (-b - Math.sqrt(d)) / 2 * a
end

coefficients = []
[1, 2, 3].each do |elem|
  puts "Коэффициент #{elem}: "
  coefficient = gets.chomp
  raise 'Только числа' unless coefficient =~ /[0-9]/
  coefficients << coefficient.to_f
end
raise 'Первый коэффициент не может равняться нулю' if coefficients.first.zero?
a, b, c = coefficients

discriminant = b**2 - 4 * a * c

if discriminant.negative?
  puts 'Действительных корней нет'
else
  roots(discriminant, a, b).uniq.map { |root| puts root }
end
