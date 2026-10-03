using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System;
using System.Collections.Generic;

class Pokemon
{
    public string Especie { get; private set; }
    public int Nivel { get; private set; }

    public Pokemon(string especie, int nivel)
    {
        Especie = especie;
        Nivel = nivel;
    }

    public virtual void Atacar()
    {
        Console.WriteLine($"{Especie} (Nv. {Nivel}) usa um ataque comum!");
    }
}

class TipoPlanta : Pokemon
{
    public TipoPlanta(string especie, int nivel) : base(especie, nivel) { }

    public override void Atacar()
    {
        Console.WriteLine($"{Especie} (Nv. {Nivel}) usa Leaf Blade!");
    }
}

class TipoEletrico : Pokemon
{
    public TipoEletrico(string especie, int nivel) : base(especie, nivel) { }

    public override void Atacar()
    {
        base.Atacar();
        Console.WriteLine($"{Especie} (Nv. {Nivel}) solta uma descarga elétrica!");
    }
}

class Program
{
    static void Main()
    {
        List<Pokemon> pokemons = new List<Pokemon>
        {
            new TipoPlanta("Rowlet", 70),
            new TipoEletrico("Raichu de Alola", 65),
            new Pokemon("Arceus", 100)
        };

        foreach (Pokemon poke in pokemons)
        {
            poke.Atacar();
        }
    }
}