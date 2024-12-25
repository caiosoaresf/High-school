print("Discover how many times a certain letter repeat in the word")

def Repetitions(q,w):
  counter = 0
  for i in q:
    if i == w:
      counter += 1
  return counter

word = str(input("Insert the word you desire to count a certain letter: "))

let = str(input("Inform the letter: "))

print(Repetitions(word, let))