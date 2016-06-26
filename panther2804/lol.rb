t = 0
t2 = 0
t3 = 0
0.upto(100) do
  t = 0
  t2 = 0
  t3 = 0
  0.upto(10) do |q|
    w = rand(10)
    w += 1
    t += w
    t2+=q
# puts q
    puts w
    puts t
    puts t2
    puts '---'
  end
  t3 += t
end
puts t3
t3 = t3/100
puts t3