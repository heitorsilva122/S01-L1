package main
import "fmt" 

func ValidarCodigoRastreio(codigo string) (bool, string) {
	contador := 0
	for contador < len(codigo) {
		contador++
  }
  if contador == 10{
	return true, "Código de rastreio registrado no sistema!"
  } else {
	return false, "Erro: O código de rastreio deve ter exatamente 10 caracteres."
  }
}

func main() {
	var codigo string
	fmt.Scanln(&codigo) 

	status, mensagem := ValidarCodigoRastreio(codigo)

	if status{
		fmt.Printf(mensagem)
	} else {
		fmt.Printf(mensagem)
	}
}