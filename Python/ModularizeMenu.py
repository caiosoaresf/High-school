def exibitMenu():
    print("#### MENU ####\n")
    print("0 - LEAVE\n")
    print("1 - addition\n")
    print("2 - SUBTRACT\n")
    print("3 - MULTIPLY\n")
    print("4 - DIVIDE\n")
    option = int(input("Select an option: "))
    return option

def addition(number1, number2):
    result = number1 + number2
    return result

def subtract(number1, number2):
    result = number1 - number2
    return result

def multiply(number1, number2):
    result = number1 * number2
    return result

def divide(number1, number2):
    result = number1 / number2
    return result

option = 1
while option != 0:
    option = exibitMenu()
    break 

num1 = int(input("Insert the first number: "))
num2 = int(input("Insert the second number: "))

if option == 1:
    result = addition(num1,num2)
elif option == 2:
    result = subtract(num1,num2)
elif option == 3:
    result = multiply(num1,num2)
elif option == 4:
    result = divide(num1,num2)    

print("result: %f\n\n"%result)