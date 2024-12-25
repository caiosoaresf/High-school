w1 = str(input("Insert the first word: "))
w2 = str(input("Insert the second word: "))
    

def EqualityDetector(w1,w2):
  if w1 == w2:
    return True
  else:
    return False
d = EqualityDetector(w1,w2)
if d == True:
  print("Equal words")
else:
  print("Different words")