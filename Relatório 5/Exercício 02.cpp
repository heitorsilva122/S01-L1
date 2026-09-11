#include <iostream>
#include <string>
using namespace std;

float calcular_confiabilidade_sistema(float probabilidades[], int tamanho){
    float chance = 1;
    for(int i = 0; i < tamanho; i++){
        chance = chance * probabilidades[i];
    }
    return chance;
}

int main() {
    float probabilidades[10];
    int n;
    cout << "Digite a quantidade de componentes do sistema: ";
    cin >> n;
    for(int i = 0; i < n; i++){
        cout << "Digite a probabilidade do componente " << i + 1 << " (ex: 0.95): ";
        cin >> probabilidades[i];
    }
    float chance = calcular_confiabilidade_sistema(probabilidades, n);
    cout << "Confiabilidade total do sistema: " << chance << " (" << chance * 100 << "%)";
    return 0;
}