array = (10..100).to_a.select { |x| (x % 5).zero? }
print array
