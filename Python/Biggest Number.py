A = float(input("Insert the first number: "))
B = float(input("Insert the second number: "))
C = float(input("Insert the third number: "))

if A > B > C:
    print(f"The biggest number é {A}")
elif A > C > B:
    print(f"The biggest number é {A}")
elif B > A > C:
    print(f"The biggest number é {B}")
elif B > C > A:
    print(f"The biggest number é {B}")
elif C > A > B:
    print(f"The biggest number é {C}")
elif C > B > A:
    print(f"The biggest number é {C}")
elif A == B:
    print("There are two or more equal values")
elif A == C:
    print("There are two or more equal values")
elif C == B:
    print("There are two or more equal values")
else:
    print("There are two or more equal values")