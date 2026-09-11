#include <iostream>
#include <string>
using namespace std;

int main() {
    int opcao;
    float carga_total, peso_adicional, peso_retirado;
    float peso_atual = 0.0;
    cout << "Informe a capacidade maxima de carga do drone (kg): " << endl;
    cin >> carga_total;
    do{
        cout << "=== SISTEMA DE CARGA DO DRONE ===" << endl;
        cout << "1. Verificar Carga Atual:" << endl;
        cout << "2. Carregar Pacote" << endl;
        cout << "3. Descarregar Pacote" << endl;
        cout << "4. Encerrar Operacao" << endl;
        cout << "Escolha uma opção: ";
        cin >> opcao;

        switch(opcao){
            case 1:
                cout << "Carga Atual: " << peso_atual << " kg / " << carga_total << " kg" << endl;
                cout << "Espaço disponivel: " << carga_total - peso_atual << " kg" << endl;
                break;
            case 2:
                cout << "Digite o peso do pacote a ser carregado (kg): ";
                cin >> peso_adicional;
                if (peso_atual + peso_adicional > carga_total){
                    cout << "Alerta: Peso maximo de decolagem excedido! Operacao cancelada" << endl;
                }else{
                    peso_atual += peso_adicional;
                    cout << "Pacote adicionado com sucesso!" << endl;
                }
                break;
            case 3:
                cout << "Digite o peso do pacote a ser descarregado (kg): ";
                cin >> peso_retirado;
                if (peso_atual - peso_retirado < 0){
                    cout << "Alerta: você esta tentando remover mais peso doque o drone possui! Operacao cancelada" << endl;
                }else{
                    peso_atual -= peso_retirado;
                    cout << "Pacote removido com sucesso!" << endl;
                }
                break;
            case 4:
                cout << "Encerrando sistema de telemetria..." << endl;
                break;
            default:
                cout << "Opção invalida!" << endl;
        }
    } while (opcao != 4);
    return 0;
}