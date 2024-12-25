str = str(input("Insert a word: "))
void = " "

for i in range(0, len(str)):
  void = void + str[i]
  word = void.upper()
print(word)