package main
import "fmt" 

func gerarEscalaPlantao(n int){
	contador := 1
	fmt.Printf("\n--- Escala de Plantão Técnico ---\n")

	for j := 0; j < n; j++ {
		fmt.Printf("\nPlantão %v: Dia %v do mês", j + 1, contador)
		contador = contador + 4
	}
}

func main() {
	var plantao int
	fmt.Printf("Digite a quantidade de plantões necessários:\n")
	fmt.Scanln(&plantao) 

	gerarEscalaPlantao(plantao)
}