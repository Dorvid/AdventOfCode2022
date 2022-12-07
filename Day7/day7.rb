# frozen_string_literals: true

class DDir
  attr_accessor :name
  attr_accessor :contains
  attr_accessor :size
  attr_accessor :parent_dir

  def initialize(name,parent_dir)
    @name = name
    @contains = []
    @size = 0
    @parent_dir = parent_dir
  end

  def get_size()
    contains.each do |item|
      @size += item.get_size() if item.is_a?(DDir)
      @size += item.size if item.is_a?(DirFile)
    end

    @size
  end
end

class DirFile
  attr_accessor :name
  attr_accessor :size

  def initialize(name,size)
    @name = name
    @size = size.to_i
  end
end

def create_tree(head, all_dirs)
  current_dir = head
  File.readlines("input.txt").each do |line|
    line = line.chomp
    next if line == "$ cd /" || line == "$ ls"

    command = line.split(' ')

    if command.first == "dir" # create directory
      new_dir = DDir.new(command[1],current_dir)
      current_dir.contains.push(new_dir)
      all_dirs.push(new_dir)
    elsif command[0] == "$" && command[1] == "cd"
      if command[2] == ".." # Step out of directory
        current_dir = current_dir.parent_dir
      else #Step into directory
        current_dir.contains.each do |item|
          next if item.is_a?(DirFile)
          if item.name == command[2]
            current_dir = item
            break
          end
        end
      end
    else # Create file
      current_dir.contains.push(DirFile.new(command[1],command[0]))
    end
  end
end

def part1(max)
  head = DDir.new("/",nil)
  all_dirs = [head]

  create_tree(head, all_dirs)

  head.get_size() #recursively count all sizes

  sum = 0
  all_dirs.each do |dir|
    sum += dir.size if dir.size <= max
  end
  sum
end

def part2()
  total_size_needed = 30_000_000
  total_size = 70_000_000
  head = DDir.new("/",nil)
  all_dirs = [head]

  create_tree(head, all_dirs)

  used_size = head.get_size() #recursively count all sizes
  size_needed = total_size_needed-(total_size - used_size)

  size_of_dirs = []
  all_dirs.each do |dir|
    size_of_dirs.push(dir.size) if dir.size >= size_needed
  end

  size_of_dirs.sort.first
end

puts "Part 1: #{part1(100000)}"
puts "Part 2: #{part2()}"
