package main
import "fmt" 

func main() {
	var vt1 int
	fmt.Printf("Digite as vendas do 1º trimestre: ")
	fmt.Scanln(&vt1) 

	var vt2 int
	fmt.Printf("\nDigite as vendas do 2º trimestre: ")
	fmt.Scanln(&vt2) 

	var vt3 int
	fmt.Printf("\nDigite as vendas do 3º trimestre: ")
	fmt.Scanln(&vt3) 

	soma := vt1 + vt2 + vt3

	switch {
		case soma > 100 && soma <= 179:
			fmt.Println("\nClassificação: Categoria Pleno")
		case soma > 179 && soma <= 249:
			fmt.Println("\nClassificação: Categoria Sênior")
		case soma > 249:
			fmt.Println("\nClassificação: Categoria Top Seller")
		default:
			fmt.Println("\nMeta mínima anual não atingida!")
	}
}