import java.util.HashMap;

interface Sobrenatural {
    void manifestar();
}

class Alienigena implements Sobrenatural {
    private String nome;

    public Alienigena(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " ativa um escudo de energia e observa os intrusos!");
    }
}

class EspiritoYoukai implements Sobrenatural {
    private String nome;

    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " faz as luzes piscarem e sussurra um aviso!");
    }
}

class MapaDeAvistamentos {
    private HashMap<String, Sobrenatural> avistamentos;

    public MapaDeAvistamentos() {
        avistamentos = new HashMap<>();
    }

    public void registrar(String local, Sobrenatural ser) {
        avistamentos.put(local, ser);
    }

    public void investigar(String local) {
        Sobrenatural ser = avistamentos.get(local);
        if (ser == null) {
            System.out.println(local + " está tranquilo, nada para ver aqui.");
        } else {
            ser.manifestar();
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Alienigena serpo = new Alienigena("Serpo");
        EspiritoYoukai vovoturbo = new EspiritoYoukai("Vovó Turbo");

        MapaDeAvistamentos mapa = new MapaDeAvistamentos();

        mapa.registrar("Túnel Suspeito", vovoturbo);
        mapa.registrar("Predio abandonado", serpo);

        mapa.investigar("Túnel Suspeito");
        mapa.investigar("Predio abandonado");
        mapa.investigar("Escola");
    }
}