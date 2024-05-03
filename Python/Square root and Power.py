x = float(input("Insert the first number: "))
y = float(input("Insert the second number: "))
print("First number to the power of the second(a)")
print("Square root of both numbers(b)")
opcao = input("Select the operation (a/b))")

if opcao == "a":
    Rs = (x ** y)
    print(f"The result is: {Rs:.2f}")
elif opcao == "b":
    Rs = (x ** 0.5) 
    Rs2 = (y ** 0.5)
    print(f"The result is: {Rs:.2f} e {Rs2:.2f}")
else:
    print("Invalid operation")

             