PA = []
n = int(input('Insert a number: '))
vezes = 0
for i in range(1, n + 1, 2):
    vezes = vezes + 1
    multiplicacao = 3 * i + 1
    PA += [(f'3 x {i} + 1 = {multiplicacao}')]
print(PA)