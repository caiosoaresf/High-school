x = int(input('Insert a number: '))
def primo(x):
   if x < 2:
      return False
   elif x == 2:
      return True
   elif x == 3:
      return True
   elif x == 5:
      return True
   else:
      if x%2 == 0:
         return False
      elif x%3 == 0:
         return False
      elif x%5 == 0:
         return False
      else:
         return True
      

numero = primo(x)
if numero == True:
   print('This number is a prime number')
else:
   print('This number is not a prime number')    
