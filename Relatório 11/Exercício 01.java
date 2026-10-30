import java.util.*;

abstract class Morador {
    private String nome;

    public Morador(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract void apresentar();
}

class Mago extends Morador {
    private String feitico;

    public Mago(String nome, String feitico) {
        super(nome);
        this.feitico = feitico;
    }

    @Override
    public void apresentar() {
        System.out.println(getNome() + " é um mago que domina o feitiço de " + feitico);
    }
}

class DemonioDoFogo extends Morador {
    public DemonioDoFogo(String nome) {
        super(nome);
    }

    @Override
    public void apresentar() {
        System.out.println(getNome() + " é o demônio do fogo que faz o castelo andar!");
    }
}

public class Main {
    public static void main(String[] args) {
        Morador mago = new Mago("Sophie", "transformação");
        Morador demonio = new DemonioDoFogo("Calcifer");

        mago.apresentar();
        demonio.apresentar();

        // Morador morador = new Morador("Genérico");
        // Erro de compilação: Morador is abstract; cannot be instantiated
    }
}