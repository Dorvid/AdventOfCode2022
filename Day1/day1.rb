# frozen_string_literal: true



def part1()
  total_calories = 0
  sum = 0

  File.readlines("input.txt").each do |line|
    if line == "\n"
      total_calories = sum if sum > total_calories
      sum = 0
    else

      sum += line.chomp.to_i
    end
  end

  total_calories
end

def part2()
  arr = []
  sum = 0
  File.readlines("input.txt").each do |line|
    if line == "\n"
      arr.push(sum)

      sum = 0
    else
      sum += line.chomp.to_i
    end
  end

  arr.sort.last(3).sum
end

puts "Part 1: #{part1}"
puts "Part 2: #{part2}"