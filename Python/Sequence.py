n = int(float(input("Inform the amount of sequences: ")))

S = 0
denominador = 4
print("S = ", end="")
for numerador in range (3, 2 * n + 2, 2):
    S += (numerador / denominador)
    print(f"{numerador}/{denominador} + ", end="")
    denominador += 4
print(f"\n\nThe sequence will be = {S:.2f}")

