#include <iostream>
#include <iomanip>
#include <string>
using namespace std;

int main() {
    int opcao, fileira, coluna, matriz_solar[5][5];
    float capacidade, ativa = 0, inativa = 0;

    for(int i = 0; i < 5; i++){
        for(int j = 0; j < 5; j++){
            matriz_solar[i][j] = 0;
        }
    }

    do{
        cout << "=== TELEMETRIA DO PAINEL SOLAR ===" << endl;
        cout << "1. Ativar Celula" << endl;
        cout << "2. Ver Mapa da Matriz" << endl;
        cout << "3. Sair" << endl;
        cout << "Escolha uma opção: ";
        cin >> opcao;

        switch(opcao){
            case 1:
                cout << "Digite a fileira (0-4): ";
                cin >> fileira;
                cout << "Digite a coluna (0-4): ";
                cin >> coluna;
                if(matriz_solar[fileira][coluna] == 1){
                    cout << "Erro: Célula solar já está em operação!" << endl;
                }else{
                    matriz_solar[fileira][coluna] = 1;
                    cout << "Sucesso: Célula solar ativada!" << endl;
                }
                break;
            case 2:
                cout << "--- Mapa da Matriz Solar ---" << endl;
                for(int i = 0; i < 5; i++){
                    for(int j = 0; j < 5; j++){
                        cout << "[" << matriz_solar[i][j] << "] ";
                    }
                    cout << endl;
                }
                break;
            case 3:
                cout << "=== RELATORIO FINAL DE OPERACAO ===" << endl;
                for(int i = 0; i < 5; i++){
                    for(int j = 0; j < 5; j++){
                        if(matriz_solar[i][j] == 1) ativa++;
                        if(matriz_solar[i][j] == 0) inativa++;
                        }
                    }
                        cout << "Total de celulas ATIVAS: " << ativa << endl;
                        cout << "Total de celulas INATIVAS: " << inativa << endl;
                        capacidade = (ativa / inativa) * 100; 
                        cout << fixed << setprecision(2) << endl;
                        cout << "Capacidade Operacional: " << capacidade << "%" << endl;
                break;
            default:
                cout << "Opção invalida!" << endl;
        }
    } while (opcao != 3);
    return 0;
}