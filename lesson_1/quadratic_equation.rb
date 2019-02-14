def roots(discriminant, coefficient_a, coefficient_b)
  roots_list = []
  roots_list << (- coefficient_b + Math.sqrt(discriminant)) / 2 * coefficient_a
  return roots_list if discriminant.zero?

  roots_list << (- coefficient_b - Math.sqrt(discriminant)) / 2 * coefficient_a
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
