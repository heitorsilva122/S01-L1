import java.util.ArrayList;

abstract class Monstro {
    private String nome;

    public Monstro(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract String receita();
}

class Slime extends Monstro {
    public Slime(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "cozido lentamente até formar uma geleia saborosa";
    }
}

class Mandragora extends Monstro {
    public Mandragora(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "assada no forno com ervas, depois de arrancada com cuidado para não gritar";
    }
}

class Panela {
    private String material;

    public Panela(String material) {
        this.material = material;
    }

    public String getMaterial() {
        return material;
    }
}

class Cozinheiro {
    private String nome;
    private Panela panela;
    private ArrayList<Monstro> ingredientes;

    public Cozinheiro(String nome, String materialDaPanela) {
        this.nome = nome;
        // composição: a panela é criada dentro do construtor do cozinheiro 
        // ela nasce junto com ele e so existe enquanto ele existir
        this.panela = new Panela(materialDaPanela);
        this.ingredientes = new ArrayList<>();
    }

    public void adicionarIngrediente(Monstro monstro) {
        // agregação: o monstro ja existia antes de ser derrotado e
        // adicionado aqui, ele continua existindo independentemente do cozinheiro
        ingredientes.add(monstro);
    }

    public void servirBanquete() {
        System.out.println(nome + " serve o banquete, preparado na panela de " + panela.getMaterial());
        for (Monstro monstro : ingredientes) {
            System.out.println(monstro.getNome() + ": " + monstro.receita());
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Slime slime = new Slime("Slime Azul");
        Mandragora mandragora = new Mandragora("Mandrágora Gritante");

        Cozinheiro senshi = new Cozinheiro("Senshi", "ferro fundido");

        senshi.adicionarIngrediente(slime);
        senshi.adicionarIngrediente(mandragora);

        senshi.servirBanquete();
    }
}