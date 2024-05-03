print("Discover your type of triangle ")
x = float(input("Insert the first side: "))
y = float(input("Insert the second side: "))
z = float(input("Insert the third side: "))

if x != y != z:
    print("The triangle is scalene")
elif x == y == z:
    print("The triangle is equilateral")
else:
    print("The triangle is isosceles")