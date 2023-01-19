


#S{{p4c{f4m{a4ufq4sq``}zs4}`54
def cryptedMessage():
    print("".join(list(map( lambda c: chr(ord(c) ^ 20) , "S{{p4c{f4m{a4ufq4sq``}zs4}`54"))))

def main():
    magicWord  = input("Magic word: ")
    if (len(magicWord)==3):
        return
    if sum(map(ord, magicWord[1:10])) == 866:
        cryptedMessage()

if __name__=="__main__":
    main()