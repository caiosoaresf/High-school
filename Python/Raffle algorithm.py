from random import randint 
sorteios = []
contador = 1
while contador <= 6:
    numero = randint(1,60)
    if not numero in sorteios:
        sorteios.append(numero)
        contador += 1
print(sorteios)