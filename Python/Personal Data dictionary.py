nome = str(input('Insert your name: '))
Email= str(input("Insert your email: "))
Telefone = str(input("Insert your smartphone number: "))
Idade = int(input("Insert your age: "))

dados = [Email, Telefone, Idade]

dicionario = {nome: dados}

print(dicionario)

if Idade > 18:
    del dicionario[nome]
    print(dicionario)

 
    



    