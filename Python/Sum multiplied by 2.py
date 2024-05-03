def funcao(x):
    return 2 * x

def lista(lista):
    soma = 0
    for i in lista:
        soma = soma + funcao(i)
    return soma

y = []
vezes = int(input("How many values do you want to add: "))
for i in range(0,vezes):
    u = int(input("Insert the values: "))
    y.append(u)
s = lista(y)
print(s)