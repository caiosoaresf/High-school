x = float(input("Insert the first number: "))
y = float(input("Insert the second number: "))
operador = input("Select the operator: (+,-,*,/,**): ")

if operador == "+":
    calculo = x + y
elif operador == "-":
    calculo = x - y
elif operador == "*":
    calculo = x * y
elif operador == "/":
    calculo = x / y
elif operador == "**":
    calculo = x ** y
else:
    print("Invalid Operator >:(")

if 'calculo' in locals():
    print(f"The value is: ",calculo)
