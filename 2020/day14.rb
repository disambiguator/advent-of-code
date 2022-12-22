require 'pry'
require "matrix"
# @file = File.read('./inputs/day14')
@file = File.read 'sample'
@lines = @file.split("\n").map do |line|
    if line.start_with? 'mask'
        line.split ' = '
    else
        mem, dest, value = (line.scan /(mem)\[(.*)\] = (.*)/)[0]
        [mem, dest.to_i, value.to_i]
    end
end

def part1
    mask = ''
    mem = []
    @lines.each do |line|
        case line[0]
        when 'mask'
            mask = line[1]
        when 'mem'
            _, dest, value = line
            mem[dest] = (value | mask.gsub('X', '0').to_i(2)) & mask.gsub('X', '1').to_i(2)
            puts [dest, (value | mask.gsub('X', '0').to_i(2)) & mask.gsub('X', '1').to_i(2)].inspect
        end
    end

    puts mem.compact.sum
    puts mem.compact.sum == 17765746710228
end

# part1

def part2
    mask = ''
    mem = []
    lines.each do |line|
        case line[0]
        when 'mask'
            mask = line[1]
        when 'mem'
            _, dest, value = line



            # masks =

            # mem[dest] = (value | mask.gsub('X', '0').to_i(2)) & mask.gsub('X', '1').to_i(2)
            # puts [dest, (value | mask.gsub('X', '0').to_i(2)) & mask.gsub('X', '1').to_i(2)].inspect
        end
    end

    puts mem.compact.sum
end

part2