Numeros = []
Quantidade = int(input("Insert the amount of numbers (min 2): "))
Vezes = 0
print("It will show the total amount, then even numbers, then odd numbers")

while(Vezes < Quantidade):
    Numeros += [int(input("Insert a number: "))]
    Vezes = Vezes + 1
print(Numeros)

Par = [pares for pares in Numeros if (pares % 2) == 0]
print(Par)

Impar = [impares for impares in Numeros if (impares % 2) == 1]
print(Impar)
