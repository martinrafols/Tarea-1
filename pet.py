a1=input()
a2=input()
a3=input()
a4=input()
a5=input()
notas=list()
notas.append(a1)
notas.append(a2)
notas.append(a3)
notas.append(a4)
notas.append(a5)
def sumalista(listaNumeros):
    laSuma = 0
    for i in listaNumeros:
        i=int(i)
        laSuma += i
    return laSuma
puntajes=[]
for i in notas:
    i=i.split(" ")
    for j in i:
        j=int(j)
    puntajes.append(sumalista(i))
max=max(puntajes)
pos=puntajes.index(max)+1

print(str(pos)+" "+str(max))