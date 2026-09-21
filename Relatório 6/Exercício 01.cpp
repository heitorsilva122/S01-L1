#include <iostream>
#include <vector>
#include <string>
using namespace std;

class Banda {
private:
    string nome;
    int integrantes;
    float potenciaSom;
    int energia;

public:
    Banda(string n, int i, float p, int e) : nome(n), integrantes(i), potenciaSom(p), energia(e) {}

    void duelar(Banda& rival) {
        cout << "A banda " << nome << " subiu ao palco e desafiou " << rival.nome << " com potencia de som " << potenciaSom << "!" << endl;

        rival.energia -= potenciaSom;

    }

    void exibirStatus() const {
        cout << "Banda: " << nome << " | Integrantes: " << integrantes << " | Potencia do Som: " << potenciaSom << " | Energia: " << energia << endl;
    }
};

int main() {
    Banda banda1("The Beatles", 4, 35.5, 100);
    Banda banda2("Led Zeppelin", 4, 28.0, 100);

    banda1.duelar(banda2);

    cout << endl << "Status apos o duelo:" << endl;
    banda1.exibirStatus();
    banda2.exibirStatus();

    return 0;
}