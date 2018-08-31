while True:  
    libro=[]
    frase=input()
    frase=frase.split(" ")
    libro.append(frase)
for h in range (len(libro)):
    fra=libro[h]
    for i in range (len(fra)):
        if i==".":
            break
        for j in range (i+1,len(fra)):
            if fra[i]==fra[j]:
                fra[j]="."
        for k in range (h+1,len(libro)):
            fr=libro[k]
            for j in range (len(fr)):
                if fra[i]==fr[j]:
                    fr[j]="."
    fra=" ".join(fra)
print (frase)