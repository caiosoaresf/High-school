print("Your medium score needs to be higher than 60 ")
Nota1 = int(input("Insert the first grade: "))
Nota2 = int(input("Insert the second grade: "))
Nota3 = int(input("Insert the third grade: "))
Nota4 = int(input("Insert the fourth grade: "))
notas = [Nota1, Nota2, Nota3, Nota4]
def media(notas):
    media = 0
    for i in notas:
        media = media + i
    media /= 4
    return media

md = media(notas)
print(md)
if md >= 60:
    print('You were approved')
else:
    print('You were reproved')

    



