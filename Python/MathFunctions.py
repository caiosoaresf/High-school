def root(x, y):
  r = x ** (1/y)  
  print(r)
def factorial(n):
    f = 1
    for i in range(1, n+1):
        f *= i
    print(f)
def division(x, y):
    rest = x % y
    quocient = x // y
    print("rest: ",rest,"quocient: ",quocient,)

        
x = int(input("insert the value of x: "))
y = int(input("insert the value of y: "))
f = int(input("insert the value of f: "))
root(x,y)
factorial(f)
division(x,y)