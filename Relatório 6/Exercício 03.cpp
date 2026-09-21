#include <iostream>
#include <string>
using namespace std;

class Hobbit
{
protected:
    string nome;

public:
    Hobbit(string n) : nome(n) {}

    virtual void fazerAtividade()
    {
        cout << "Sou um membro da comunidade Inatel: " << nome << "." << endl;
    }
};

class Jardineiro : public Hobbit
{
private:
    string curso;

public:
    Jardineiro(string n, string c) : Hobbit(n), curso(c) {}

    void fazerAtividade() override
    {
        cout << "Meu nome é " << nome << " e estudo no curso de " << curso << "." << endl;
    }
};

class Cozinheiro : public Hobbit
{
private:
    string disciplina;

public:
    Cozinheiro(string n, string d) : Hobbit(n), disciplina(d) {}

    void fazerAtividade() override
    {
        cout << "Meu nome é " << nome << " e leciono a disciplina de " << disciplina << "." << endl;
    }
};

int main()
{
    Jardineiro aluno("Heitor", "Engenharia de Software");
    Cozinheiro professor("Ruan", "Paradigmas da Programação");

    aluno.fazerAtividade();
    professor.fazerAtividade();

    return 0;
}