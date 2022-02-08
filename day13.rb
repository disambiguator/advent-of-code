require 'pry'
require "matrix"
file = File.read('./inputs/day13')
# file = File.read('sample')

@rows = file.split("\n")

def part1
    time = @rows[0].to_i
    buses = @rows[1].split(',').filter { |b| b != 'x' }.map(&:to_i)
    m = buses.map do |b|
        [b, b - time % b]
    end.min do |a, b|
        a[1] <=> b[1]
    end

    puts m[0] * m[1]
end

def part2
    # t = 9404107
    t = 530768200000
    buses = @rows[1].split(',').map.with_index do |b, i|
        next nil if b == 'x'
        [b.to_i, i]
    end.compact

    puts buses.inspect
    return
    while true
        puts t if t % 100000 == 0
        m = buses.map do |line|
            b, i = line

            (b - t % b) % b - i
        end

        if m.all? { _1 == 0 }
            puts "The answer is #{t}"
            return
        else
            t+=[m.max, 1].max
        end

    end
end

part2