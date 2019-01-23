alphabet = ('a'..'z').to_a
vowels = ['a', 'e', 'i', 'o', 'u', 'y']
vowels_hash = {}
alphabet.each_with_index { |letter, index| vowels_hash[letter] = index + 1 if vowels.include?(letter) }
print vowels_hash
