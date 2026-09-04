# Nome: 
Heitor Luis Oliveira Silva

# Matricula: 
845

# Prompt Utilizado:
"como fazer um for que funciona vai do inicio até o fim de uma string em go? algo como string.len"

# Resposta Obtida:
"Em Go, você tem duas formas principais, dependendo do que você quer: percorrer por bytes ou por caracteres (runes).

1. len() para saber o tamanho (em bytes)

go
package main

import "fmt"

func main() {
    texto := "olá"
    fmt.Println(len(texto)) // 4 (não 3! "á" ocupa 2 bytes em UTF-8)
}

2. for com índice tradicional (percorre byte a byte)

go
package main

import "fmt"

func main() {
    texto := "hello"
    for i := 0; i < len(texto); i++ {
        fmt.Printf("%c\n", texto[i])
    }
}

⚠️ Cuidado: isso funciona bem para ASCII, mas quebra caracteres acentuados/especiais (UTF-8 multi-byte), porque texto[i] acessa bytes, não caracteres.

3. for range (a forma idiomática em Go — percorre por rune/caractere)

go
package main

import "fmt"

func main() {
    texto := "olá"
    for i, char := range texto {
        fmt.Printf("Índice: %d, Caractere: %c\n", i, char)
    }
}

Aqui i é o índice do byte onde o caractere começa (não uma sequência 0,1,2...), e char é o rune (caractere Unicode) correto. Isso é importante notar: com acentos, os índices podem "pular" (0, 1, 3, ...) porque alguns caracteres ocupam mais de 1 byte.

4. Se quiser contar caracteres (runes) em vez de bytes

go
package main

import (
    "fmt"
    "unicode/utf8"
)

func main() {
    texto := "olá"
    fmt.Println(utf8.RuneCountInString(texto)) // 3 (correto, mesmo com acento)
}

Resumo — qual usar:

Só precisa do tamanho em bytes → len(texto)
Precisa do tamanho real de caracteres (com acentos) → utf8.RuneCountInString(texto)
Quer percorrer os caracteres corretamente → for i, char := range texto
Sabe que é só ASCII e quer acesso por índice numérico simples → for i := 0; i < len(texto); i++

Para a maioria dos casos com texto em português (que tem acentos), for range é a forma mais segura e idiomática."

# Relatório:

como a forma de ver o tamanho de uma string varia muito de linguagem para linguagem, eu não sabia exatamente como ver ja que não foi mostrado no video do relatório, em algumas é string.len e em outras, assim como go, é len(string)