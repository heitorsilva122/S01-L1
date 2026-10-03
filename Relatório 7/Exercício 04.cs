using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System;
using System.Collections.Generic;

class EntidadeCosmica
{
    public string Nome { get; private set; }
    public string Origem { get; private set; } = "Desconhecida";

    public EntidadeCosmica(string nome)
    {
        Nome = nome;
    }

    public void DefinirOrigem(string origem)
    {
        Origem = origem;
    }

    public virtual void Manifestar()
    {
        Console.Write($"{Nome} se manifesta");
        if (Origem != "Desconhecida")
        {
            Console.Write($" (Origem: {Origem})");
        }
        Console.WriteLine();
    }
}

class Profundo : EntidadeCosmica
{
    public Profundo(string nome) : base(nome) { }

    public override void Manifestar()
    {
        Console.WriteLine($"{Nome} emerge das profundezas do oceano...");
    }
}

class MiGo : EntidadeCosmica
{
    public MiGo(string nome) : base(nome) { }

    public override void Manifestar()
    {
        base.Manifestar();
        Console.WriteLine($"{Nome} sussurra através do fungo rosado em sua mente...");
    }
}

class Pesquisador
{
    public string Nome { get; private set; }
    private List<EntidadeCosmica> catalogo = new List<EntidadeCosmica>();

    public Pesquisador(string nome)
    {
        Nome = nome;
    }

    public void Catalogar(EntidadeCosmica e)
    {
        catalogo.Add(e);
    }

    public void LerCatalogo()
    {
        Console.WriteLine($"Catálogo de {Nome}:");
        foreach (EntidadeCosmica e in catalogo)
        {
            e.Manifestar();
        }
    }
}

class Program
{
    static void Main()
    {
        EntidadeCosmica desconhecida = new EntidadeCosmica("Ser sem nome");
        Profundo profundo = new Profundo("Dagon");
        MiGo migo = new MiGo("Akley-Prime");

        migo.DefinirOrigem("Yuggoth");

        Pesquisador armitage = new Pesquisador("Dr. Armitage");

        armitage.Catalogar(desconhecida);
        armitage.Catalogar(profundo);
        armitage.Catalogar(migo);

        armitage.LerCatalogo();
    }
}