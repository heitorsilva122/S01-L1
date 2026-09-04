package main
import "fmt" 

 func validarIngresso(setor string, codigo int) (bool){
	if setor == "VIP" && codigo == 2026{
		return true
	} else{
		return false
	}
}

func main() {
	i := 1

	for i == 1 {
		var setor string
		fmt.Printf("Digite o setor do ingresso:\n")
		fmt.Scanln(&setor) 
		
		var codigo int
		fmt.Printf("Digite o código do ingresso:\n")
		fmt.Scanln(&codigo) 	

		validacao := validarIngresso(setor, codigo)

		if validacao{
			fmt.Printf("Acesso liberado à área VIP!")
			break
		} else {
			fmt.Printf("Ingresso ou setor inválido. Tente novamente.\n\n")
		}
	}



}