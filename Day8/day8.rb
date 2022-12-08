# frozen_string_literals: true

class Tree
  attr_accessor :height
  attr_accessor :visible
  attr_accessor :scenic_score

  def initialize(height)
    @height = height
    @visible = false
    @scenic_score = 0
  end
end

def set_border_trees(trees)
  x = trees.size
  y = trees[0].size

  0.upto(x - 1) do |i|
    trees[i][0].visible = true
    trees[i][y-1].visible = true
  end

  0.upto(y - 1) do |i|
    trees[0][i].visible = true
    trees[x-1][i].visible = true
  end
end

def check_visability(trees,i,j)
  x = trees.size
  y = trees[0].size

  h = trees[i][j].height

  visible_a = true
  (i-1).downto(0) do |a|
    if h <= trees[a][j].height
      visible_a = false
      break
    end
  end

  visible_b = true
  (i+1).upto(x-1) do |b|
    if h <= trees[b][j].height
      visible_b = false
      break
    end
  end

  visible_c = true
  (j-1).downto(0) do |c|
    if h <= trees[i][c].height
      visible_c = false
      break
    end
  end

  visible_d = true
  (j+1).upto(x-1) do |d|
    if h <= trees[i][d].height
      visible_d = false
      break
    end
  end

  trees[i][j].visible = true if (visible_a || visible_b || visible_c || visible_d)
end

def check_visible_trees(trees)
  x = trees.size
  y = trees[0].size

  1.upto(x-2) do |i|
    1.upto(y-2) do |j|
      check_visability(trees,i,j)
    end
  end
end

def count_visible_trees(trees)
  count = 0
  trees.each do |arr|
    arr.each do |tree|
      count += 1 if tree.visible
    end
  end

  count
end

def part1(trees)
  x = trees.size
  y = trees[0].size

  set_border_trees(trees)
  check_visible_trees(trees)

  count_visible_trees(trees)
end

def check_scenic_score(trees,i,j)
  x = trees.size
  y = trees[0].size

  h = trees[i][j].height

  score_a = 0
  (i-1).downto(0) do |a|
    score_a += 1
    if h <= trees[a][j].height
      break
    end
  end

  score_b = 0
  (i+1).upto(x-1) do |b|
    score_b += 1
    if h <= trees[b][j].height
      break
    end
  end

  score_c = 0
  (j-1).downto(0) do |c|
    score_c += 1
    if h <= trees[i][c].height
      break
    end
  end

  score_d = 0
  (j+1).upto(x-1) do |d|
    score_d += 1
    if h <= trees[i][d].height
      break
    end
  end
  trees[i][j].scenic_score = score_a * score_b * score_c * score_d
end

def check_all_scenic_scores(trees)
  x = trees.size
  y = trees[0].size

  1.upto(x-2) do |i|
    1.upto(y-2) do |j|
      check_scenic_score(trees,i,j)
    end
  end
end

def get_highest_scenic_score(trees)
  highest = 0

  trees.each do |arr|
    arr.each do |tree|
      highest = tree.scenic_score if tree.scenic_score > highest
    end
  end

  highest
end

def part2(trees)
  x = trees.size
  y = trees[0].size

  check_all_scenic_scores(trees)

  get_highest_scenic_score(trees)
end

trees = []

File.readlines("input.txt").each do |line|
  heights = line.chomp.split('').map(&:to_i)
  temp_arr = []
  heights.each do |h|
    temp_arr.push(Tree.new(h))
  end
  trees.push(temp_arr)
end

puts "Part 1: #{part1(Marshal.load(Marshal.dump(trees)))}"
puts "Part 2: #{part2(Marshal.load(Marshal.dump(trees)))}"
