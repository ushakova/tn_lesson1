alphabet = ('a'..'z').to_a
vowels = %w[a e i o u y]
vowels_hash = {}
alphabet.each_with_index do |letter, index|
  vowels_hash[letter] = index + 1 if vowels.include?(letter)
end
print vowels_hash
