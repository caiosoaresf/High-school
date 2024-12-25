def sum_mechanism(value):
    result = 0
    while result <= 1000:
        value = int(input("Insert more values to the sum: "))
        result += value
    else:
        print("The value reached is bigger than 1000")
        print(result)
    return result

sum_mechanism(0)