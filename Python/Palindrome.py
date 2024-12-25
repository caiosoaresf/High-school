def palindrome(str):
    for n in range(0, int(len(str)/2)):
        if str[n] != str[len(str)-n-1]:
            return False
    return True

word = str(input("Insert a word: "))

result = palindrome(word)

if (result):

    print("This word is a palindrome")
else:

    print("This word is not a palindrome")