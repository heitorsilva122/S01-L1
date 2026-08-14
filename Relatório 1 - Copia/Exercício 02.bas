dim pin_certo as integer = 5498
dim pin as integer

print "Digite a senha de acesso "
input pin

while pin <> pin_certo   
    print "PIN invalido. tente novamente"
    input pin
Wend
print "Transacao autorizada"

sleep