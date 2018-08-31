while True:
    frase=input()
    frase=frase.split(" ")
    if frase=="":
        break
    for i in range (len(frase)):
        for j in range (i+1,len(frase)):
            if frase[i]==frase[j]:
                frase[j]="."
    frase=" ".join(frase)
    print (frase)