file = File.read('./inputs/day8')
lines = file.split("\n")

visited = {}
n = 0
acc = 0

possibilities = (0..lines.length - 1).select do |l|
    (lines[l].start_with? 'nop') || (lines[l].start_with? 'jmp')
end
bad = 0

while true do
    break if n == lines.length

    # puts "#{n}: #{lines[n]} | Acc: #{acc}"

    if visited[n]
        bad += 1
        visited = {}
        acc = 0
        n = 0
    end

    visited[n] = true

    op, val = lines[n].split(' ')
    val = val.to_i
    if possibilities[bad] == n
        op = (op == 'jmp' ? 'nop' : 'jmp')
    end

    case op
    when 'nop'
        n+=1
    when 'acc'
        acc += val
        n+=1
    when 'jmp'
        n+=val
    end
end

puts "Bad Intruction: #{bad}"
puts "Accumulator: #{acc}"