dados = [10,'a',3,8,9]
print(dados)

lista = []
quantasvezes = 5
vez = 1
while(vez <= quantasvezes):
    lista += [input('Insert 5 numbers: ')]
    vez = vez + 1
print(lista)

lista = [0] * 12
lista[8] = 'Chapeu'
print(lista)

dados.append(300) 
dados.append(5)
dados[2] = 5 
dados.insert(4,18) 
dados.remove(9) 
dados.pop(1) 
print(dados.index(8)) 
print(dados.count(5)) 
dados.sort(reverse=True) 
dados.reverse() 
print(dados)

t = (10, 'a', 3, 8, 9)
print(t[2])
print(t)

conjunto = set([10,3,8,9])
print(conjunto)
conjunto1 = set([18,3,7,53,9,112,7])
print(conjunto1)
print(conjunto | conjunto1)
print(conjunto & conjunto1)
print(conjunto - conjunto1)
print(conjunto ^ conjunto1)

mercado = {}
mercado['Orange'] = 5.00
mercado['Apple'] = 7.80
mercado['Banana'] = 3.50
print(mercado)
print(mercado.keys())
print(mercado.values())

fruta = input('Inform the desired fruit: ')
if fruta in mercado:
    print(f'{fruta} Costs {mercado[fruta]} BRL')
else:
    print('We do not have this fruit >:(')