# points = {
#     ')' => 3,
#     ']' => 57,
#     '}' => 1197,
#     '>' => 25137,
# }

# total = 0
# input = File.read('./inputs/day10').split("\n").map(&:chars)
# input.each do |l|
#     stack = []
#     l.each do |c|
#         case c
#         when '{'
#             stack.push(c)
#         when '('
#             stack.push(c)
#         when '<'
#             stack.push(c)
#         when '['
#             stack.push(c)
#         when ')'
#             if stack.last == '('
#                 stack.pop
#             else
#                 total += points[c]
#                 break
#             end
#         when '}'
#             if stack.last == '{'
#                 stack.pop
#             else
#                 total += points[c]
#                 break
#             end
#         when '>'
#             if stack.last == '<'
#                 stack.pop
#             else
#                 total += points[c]
#                 break
#             end
#         when ']'
#             if stack.last == '['
#                 stack.pop
#             else
#                 total += points[c]
#                 break
#             end
#         end
#     end
# end

# puts total == 442131

#part 2

points = {
    '(' => 1,
    '[' => 2,
    '{' => 3,
    '<' => 4,
}

match = {
   ')' => '(' ,
   ']' => '[' ,
   '}' => '{' ,
   '>' => '<' ,
}

input = File.read('./inputs/day10').split("\n").map(&:chars)
scores = input.map do |l|
    stack = []
    next if l.each do |c|
        if ['{','(','<', '['].include? c
            stack.push(c)
        elsif stack.last == match[c]
            stack.pop
        else
            break -1
        end
    end == -1

    stack.reverse.inject(0) { |acc, c| acc * 5 + points[c] }
end.compact

puts scores.sort[scores.length/2] == 3646451424
