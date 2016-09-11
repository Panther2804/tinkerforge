# Pauls Spiel
def init2d # #Methode definieren
  array = [] #neues Array
  0.upto(13) do |i| #x Arrays in das Array
    array[i] = []
    0.upto(13) do |j| # Alle Stellen des zweiten a Arrays mit nullen füllen
      array[i][j] = 0
    end
  end
  array
end

def print2d a #Methode fürs Drucken/Anzeigen Definieren definieren
  0.upto(a.length - 1) do |i| #Für alle Stellen des Arrays
    s = ''
    b = a[i]
    0.upto(b.length - 1) do |e|
      s += b[e].to_s
      s += ' '
    end
    puts s
  end
end

a = init2d

x = 5
y = 7
a[5][7] = 1 #erste spielerposition

print2d a #drucken




tposx = Array.new #Tailposition x
tposy = Array.new #Tailposition y
score = 0 # init score
grow = 0 # ini grow
scoreb = 0 #score of the blob when you get it
eold = 'w' #inieold mit bugprävention bei nichteingabe im 1 zug

a[rand(11)+1][rand(11)+1] = '$'
p = 0

0.upto(13) do |p| # Wände
  a[0][p] = 2
  a[13][p] = 2
  a[p][0] = 2
  a[p][13] = 2
end

puts '----------------------'
print2d a

while true
  tposx.insert(0,x)
  tposy.insert(0,y)

  e = gets.chomp #Eingabe
  if e == 'w' #Neue Position des kopfes
    x -= 1
    e = eold
  elsif e == 's'
    x += 1
    e = eold
  elsif e == 'a'
    y -= 1
    e = eold
  elsif e == 'd'
    y += 1
    e = eold
  elsif e == ''
    e = eold #Wiederverwerten alter Eingabe
    if e == 'w' #Neue Position des kopfes
      x -= 1
    elsif e == 's'
      x += 1
    elsif e == 'a'
      y -= 1
    elsif e == 'd'
      y += 1
    end
  end




  if a[x][y] == '$' #gucken ob man ins futter gerannt ist
    score += scoreb #score größer machen
    grow += scoreb # Schlange verlängern
    a[x][y] = 0

   while true #Neuer Blob verteilung
     randx = rand(11) + 1
     randy = rand(11) + 1
     if a[randx][randy] == 0
       a[randx][randy] = '$'
       break
     end
   end

    scoreb = 10 #potenziellen score auf 10 setzen
  elsif a[x][y] ==  2 #Hindernisserkennung
    break
  elsif a[x][y] ==  1 #Hindernisserkennung
    break
  end

  if grow == 0 #Lässt schlange läger werden (nach dem Essen)
    a[tposx.last][tposy.last] = 0
    tposx.pop #letzte stelle entfernt
    tposy.pop # siehe oben
  else
    grow -= 1
  end

  scoreb -= 1 if scoreb >1 #score für jeden zug kleiner machen, bis auf null angelangt

  a[x][y] = 1 #neue position

  print2d a
  puts '-------------------Score: ' + score.to_s + ' Scoreb: ' + scoreb.to_s

end


puts 'break'