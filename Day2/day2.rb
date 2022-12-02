
def move_to_score(input) # Part 1
  case input
  when "X"
    return 1
  when "Y"
    return 2
  when "Z"
    return 3
  end
end

def score_from_strategy(opponent_move, your_move) # Part 1
  case opponent_move
  when "A"
    case your_move
    when "X"
      return 0
    when "Y"
      return 3
    when "Z"
      return 6
    end
  when "B"
    case your_move
    when "X"
      return 0
    when "Y"
      return 3
    when "Z"
      return 6
    end
  when "C"
    case your_move
    when "X"
      return 6
    when "Y"
      return 0
    when "Z"
      return 3
    end
  end
end

def strategy_to_score(result)
  case result
  when "X"
    return 0
  when "Y"
    return 3
  when "Z"
    return 6
  end
end

def score_from_choice(opponent_move,result)
  case opponent_move
  when "A"
    case result
    when "X"
      return 3
    when "Y"
      return 1
    when "Z"
      return 2
    end
  when "B"
    case result
    when "X"
      return 1
    when "Y"
      return 2
    when "Z"
      return 3
    end
  when "C"
    case result
    when "X"
      return 2
    when "Y"
      return 3
    when "Z"
      return 1
    end
  end
end

def part1(input)
  sum = 0
  guide = input

  guide.each do |strategy|
    opponent_move = strategy[0]
    your_move = strategy[1]

    sum += move_to_score(your_move)
    sum += score_from_strategy(opponent_move, your_move)
  end

  sum
end

def part2(input)
  sum = 0
  guide = input

  guide.each do |strategy|
    opponent_move = strategy[0]
    result = strategy[1]

    sum += score_from_choice(opponent_move,result)
    sum += strategy_to_score(result)
  end

  sum
end

input = []
File.readlines("input.txt").each do |line|
  strategy = line.chomp.split
  input.push(strategy)
end

puts "Part 1: #{part1(input)}"

puts "Part 2: #{part2(input)}"