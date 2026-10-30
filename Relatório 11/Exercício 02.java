import java.util.ArrayList;

class ItemDoCardapio {
    private String nome;
    private double preco;

    public ItemDoCardapio(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    public double precoFinal() {
        return preco;
    }
}

class ComboLeblanc extends ItemDoCardapio {
    public ComboLeblanc(String nome, double preco) {
        super(nome, preco);
    }

    @Override
    public double precoFinal() {
        return getPreco() * 0.9;
    }
}

class CafeLeblanc {
    private ArrayList<ItemDoCardapio> cardapio;

    public CafeLeblanc() {
        cardapio = new ArrayList<>();
    }

    public void adicionar(ItemDoCardapio item) {
        cardapio.add(item);
    }

    public void mostrarCardapio() {
        for (ItemDoCardapio item : cardapio) {
            System.out.println(item.getNome() + " - R$" + item.precoFinal());
        }
    }
}

public class Main {
    public static void main(String[] args) {
        ItemDoCardapio cafeCoado = new ItemDoCardapio("Café Coado", 8.0);
        ItemDoCardapio curry = new ItemDoCardapio("Curry da Casa", 25.0);
        ComboLeblanc comboCafeTarde = new ComboLeblanc("Combo Café da Tarde", 30.0);

        CafeLeblanc leblanc = new CafeLeblanc();

        leblanc.adicionar(cafeCoado);
        leblanc.adicionar(curry);
        leblanc.adicionar(comboCafeTarde);

        leblanc.mostrarCardapio();
    }
}