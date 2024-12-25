import math

def ra(Sum):
  root = math.sqrt(Sum)
  print(f"Root of the number is {root}")
  
def co(Sum):
  cosine = math.cos(Sum)
  print(f"Cosine of the number is {cosine:.2f}")

def se(Sum):
  sine = math.sin(Sum)
  print(f"Sine of the number is {sine:.2f}")

def tan(Sum):
  tang = math.tan(Sum)
  print(f"Tangent of the number is {tang:.2f}")

def radi(Sum):
    radians = math.radians(Sum)
    print(f"Radian of the number is {radians:.2f}")

def Pi(s):    
    print(f"The number multiplied by Pi is {s * math.pi:.2f}")

def hyp(Sum):
    hy = math.hypot(Sum)
    print(f"Hypotenuse of number is {hy}")

num = float(input("Insert the first number: "))
nu = float(input("Insert the second number: "))
n =  float(input("Insert the third number: "))
nus = float(input("Insert the fourth number: "))
Sum = num + nu + n + nus
ra(Sum)
co(Sum)
se(Sum)
tan(Sum)
radi(Sum)
Pi(Sum)
hyp(Sum)

