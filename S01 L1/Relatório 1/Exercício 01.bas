dim peso as integer
dim agua as integer
dim meta as integer

print "Qual o seu peso? "
input peso

meta = peso * 35

print "Quantos mls de agua voce tomou hoje? "
input agua

if agua >= meta then
    print "Meta atingida"
else
    print "Meta nao atingida"
end if
sleep
