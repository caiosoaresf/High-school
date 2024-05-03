n = int(input("Insert a whole number: "))

S = 0 
for numerador in range (2, 2 * n + 1, 2):
    S = S + (numerador / (numerador - 1))
print(f"The sum using for is {S:.2f} ")

S = 0
numerador = 2
while numerador <= (2 * n):
    S = S + (numerador / (numerador - 1))
    numerador = numerador + 2
print(f"The sum using while is {S:.2f}")

S = 0
numerador = 2
while True:
    S = S + (numerador / (numerador - 1))
    numerador = numerador + 2
    if numerador > (2 * n):
        break
print(f"The sum using while true is {S:.2f}")

