def fatorial(numero):
    resultado = 1
    for i in range(2, numero + 1, ):
        resultado = resultado * i
    return resultado
    
numero = int(input('Insert a number: '))
fat = fatorial(numero)
print(f'The fatorial of {numero} is = {fat}')

n = int(input('Insert the value of n: '))
p = int(input('Insert the value of p: '))
Cnp = fatorial(n) / fatorial(p) * fatorial(n - p)
print(f'The combination of {n} grouping {p} to {p} = {Cnp}')