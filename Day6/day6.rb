# frozen_string_literal: true

def solve(input,size)
  char_array = []
  char_count = 0
  input.split('').each do |char|
    return char_count if char_count > size && char_array.uniq == char_array

    char_count += 1

    char_array.push(char)

    char_array.delete_at(0) if char_count > size
  end
end

input = ""
File.readlines("input.txt").each do |line|
  input = line.chomp
end

puts "Part 1: #{solve(input,4)}"
puts "Part 2: #{solve(input,14)}"