using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System;
using System.Collections.Generic;


class CombatenteDeGondor
{
    public string Nome { get; private set; }
    public string Povo { get; private set; }
    public string Posto { get; private set; }
    public string Armamento { get; private set; } = "Desarmado";

    public CombatenteDeGondor(string nome, string povo, string posto)
    {
        Nome = nome;
        Povo = povo;
        Posto = posto;
    }

    public void Equipar(string arma)
    {
        Armamento = arma;
    }

    public void ApresentarUnidade()
    {
        Console.Write($"{Nome} | {Povo} | {Posto}");
        if (Armamento != "Desarmado")
        {
            Console.Write($" | Armado com: {Armamento}");
        }
        Console.WriteLine();
    }
}

class Program
{
    static void Main()
    {
        CombatenteDeGondor soldado1 = new CombatenteDeGondor("Beregond", "Homem de Gondor", "Guarda da Cidadela");
        CombatenteDeGondor soldado2 = new CombatenteDeGondor("Pippin", "Hobbit", "Escudeiro");
        CombatenteDeGondor soldado3 = new CombatenteDeGondor("Imrahil", "Homem de Dol Amroth", "Príncipe");

        soldado1.Equipar("Espada e escudo");
        soldado3.Equipar("Lança");

        soldado1.ApresentarUnidade();
        soldado2.ApresentarUnidade();
        soldado3.ApresentarUnidade();
    }
}