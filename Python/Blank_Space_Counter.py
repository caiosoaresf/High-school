print("Discover how many spaces are in your text")

def Blank(q,w):
  counter = 0
  for i in q:
    if i == w:
      counter += 1
  return counter

pal = str(input("Insert the text you desire to see the spaces: "))

let = str(input("Press space only once and then press enter: "))

print(Blank(pal, let),"Spaces")