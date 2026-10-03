using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System;
using System.Collections.Generic;

class Grimorio
{
    public string FeiticoFavorito { get; private set; } = "Nenhum";

    public void DefinirFeitico(string feitico)
    {
        FeiticoFavorito = feitico;
    }

    public void Abrir()
    {
        Console.WriteLine($"O grimório se abre, feitiço favorito: {FeiticoFavorito}");
    }
}

class Companheiro
{
    public string Nome { get; private set; }
    public string Funcao { get; private set; }

    public Companheiro(string nome, string funcao)
    {
        Nome = nome;
        Funcao = funcao;
    }

    public void Apresentar()
    {
        Console.WriteLine($"Meu nome é {Nome}, e sou o/a {Funcao} do grupo");
    }
}

class Maga
{
    public string Nome { get; private set; }
    public Grimorio Grimorio { get; private set; }

    // Composição: o grimorio é criado dentro do construtor da maga
    // ele nasce junto com a maga e não existe fora dela, se a maga
    // deixar de existir o grimorio também deixa
    private List<Companheiro> companheiros = new List<Companheiro>();

    public Maga(string nome)
    {
        Nome = nome;
        Grimorio = new Grimorio();
    }

    // Agregação: o companheiro é criado fora da maga (na main) e só
    // depois é associado a ela via recrutar, o companheiro já existia
    // antes de conhecer a maga e continua existindo independentemente dela
    public void Recrutar(Companheiro c)
    {
        companheiros.Add(c);
    }

    public void MostrarGrupo()
    {
        Console.WriteLine($"Grupo de {Nome}:");
        foreach (Companheiro comp in companheiros)
        {
            comp.Apresentar();
        }
    }
}

class Program
{
    static void Main()
    {
        Companheiro fern = new Companheiro("Fern", "Maga");
        Companheiro stark = new Companheiro("Stark", "Guerreiro");

        Maga frieren = new Maga("Frieren");

        frieren.Recrutar(fern);
        frieren.Recrutar(stark);

        frieren.Grimorio.DefinirFeitico("Zoltraak");

        frieren.MostrarGrupo();
        frieren.Grimorio.Abrir();
    }
}