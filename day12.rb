require 'pry'
require "matrix"
file = File.read('./inputs/day12')

@rows = file.split("\n").map do |row|
    chars = row.split('')
    [chars[0], chars[1..].join('').to_i]
end

def part1
    pos = Vector[0, 0]
    direction = 0

    @rows.each do |instruction|
        cmd, amount = instruction
        case cmd
        when 'N'
            pos += amount * Vector[0, 1]
        when 'S'
            pos += amount * Vector[0, -1]
        when 'E'
            pos += amount * Vector[1, 0]
        when 'W'
            pos += amount * Vector[-1, 0]
        when 'L'
            direction += amount
        when 'R'
            direction -= amount
        when 'F'
            radians = direction * Math::PI/180
            pos += amount * Vector[Math.cos(radians).to_i, Math.sin(radians).to_i]
        end
    end

    puts pos.map(&:abs).sum
    puts pos.map(&:abs).sum == 2270
end

# part1

def part2
    pos = Vector[0.0, 0.0]
    w = Vector[10.0, 1.0]

    @rows.each do |instruction|
        cmd, amount = instruction
        case cmd
        when 'N'
            w += amount * Vector[0, 1]
        when 'S'
            w += amount * Vector[0, -1]
        when 'E'
            w += amount * Vector[1, 0]
        when 'W'
            w += amount * Vector[-1, 0]
        when 'L'
            angle = Math::atan2(w[1], w[0]) + (amount * Math::PI/180)
            w = w.magnitude * Vector[Math::cos(angle), Math::sin(angle)]
        when 'R'
            angle = Math::atan2(w[1], w[0]) - (amount * Math::PI/180)
            w = w.magnitude * Vector[Math::cos(angle), Math::sin(angle)]
        when 'F'
            pos += amount * w
        end
    end

    puts pos.map(&:abs).sum
    puts pos.map(&:abs).sum.round(2) == 138669
end

part2