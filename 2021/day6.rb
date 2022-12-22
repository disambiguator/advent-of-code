# # 385391

fish = Array.new(9, 0)
File.read('./inputs/day6').split(",").map(&:to_i).tally.each {|k,v| fish[k] = v }
256.times do
    fish.rotate!
    fish[6] += fish[8]
end

puts fish.sum == 1728611055389
