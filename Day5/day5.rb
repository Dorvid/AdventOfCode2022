# frozen_string_literals: true

input = [["G", "D", "V", "Z", "J", "S", "B"],      # 1
         ["Z", "S", "M", "G", "V", "P"],           # 2
         ["C", "L", "B", "S", "W", "T", "Q", "F"], # 3
         ["H", "J", "G", "W", "M", "R", "V", "Q"], # 4
         ["C", "L", "S", "N", "F", "M", "D"],      # 5
         ["R", "G", "C", "D"],                     # 6
         ["H", "G", "T", "R", "J", "D", "S", "Q"], # 7
         ["P", "F", "V"],                          # 8
         ["D", "R", "S", "T", "J"]]                # 9


def part1(input, rearrangements)

  rearrangements.each do |rearrangement|
    ammount, from, to = *rearrangement

    elements = input[from-1].pop(ammount).reverse
    input[to-1].push(*elements)
  end

  letters = ""
  input.each do |array|
    letters += array.last
  end

  letters
end


def part2(input, rearrangements)
  rearrangements.each do |rearrangement|
    ammount, from, to = *rearrangement

    elements = input[from-1].pop(ammount)
    input[to-1].push(*elements)
  end

  letters = ""
  input.each do |array|
    letters += array.last
  end

  letters
end

rearrangements = []
File.readlines("input.txt").each do |line|
  rearrangement = line.chomp.split
  rearrangement.delete_at(0)
  rearrangement.delete_at(1)
  rearrangement.delete_at(2)
  rearrangements.push(rearrangement.map(&:to_i))
end

puts "Part 1: #{part1(Marshal.load(Marshal.dump(input)), rearrangements)}"
puts "Part 2: #{part2(Marshal.load(Marshal.dump(input)), rearrangements)}"