from datetime import date
nome = input("Insert your name: ")
dataA = date.today() 
diaA = dataA.day  
mesA = dataA.month
anoA = dataA.year 
diaN = int(input("Insert the day you were born: ")) 
mesN = int(input("Insert the month you were born: "))
anoN = int(input("Insert the year you were born: "))

if mesN < mesA:
    idade = anoA - anoN
else:
    if mesN > mesA:
        idade = anoA - anoN - 1
    else:
         if diaN <= diaA:
             idade = anoA - anoN
         else:
             idade = anoA - anoN - 1      
print(nome,", you are",idade)        
print(f"{nome}, you are {idade}.") 
print("{}, you are {}.".format(nome, idade))
print("%s, you are %i." % (nome, idade))     

