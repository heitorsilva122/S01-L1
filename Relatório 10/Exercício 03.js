class FichaDeCriatura {
    constructor(criatura, nivelDePerigo) {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    descrever() {
        return `${this.criatura} | Nível de perigo: ${this.nivelDePerigo}`;
    }
}

class DiarioMisterioso {
    #fichas;

    constructor(numero) {
        this.numero = numero;
        this.#fichas = [];
    }

    anotar(criatura, nivelDePerigo) {
        // composição: a FichaDeCriatura é criada dentro do próprio método
        // anotar, ela nasce junto com essa anotação e só existe dentro
        // do diário
        const ficha = new FichaDeCriatura(criatura, nivelDePerigo);
        this.#fichas.push(ficha);
    }

    exibirFichas() {
        console.log(`Diário nº ${this.numero}`);
        this.#fichas.forEach(ficha => {
            console.log(ficha.descrever());
        });
    }
}

class Funcionario {
    constructor(nome, cargo) {
        this.nome = nome;
        this.cargo = cargo;
    }
}

class CabanaDoMisterio {
    #funcionarios;

    constructor(dono) {
        this.dono = dono;
        this.#funcionarios = [];
    }

    contratar(funcionario) {
        // agregação: o funcionário já existia antes de ser contratado e
        // é apenas adicionado aqui, ele continua existindo
        // independentemente da cabana
        this.#funcionarios.push(funcionario);
    }

    abrirAsPortas() {
        console.log(`Cabana do Mistério - Dono: ${this.dono}`);
        this.#funcionarios.forEach(funcionario => {
            console.log(`${funcionario.nome} - ${funcionario.cargo}`);
        });
    }
}

const diario = new DiarioMisterioso(3);

diario.anotar('Gnomo', 2);
diario.anotar('Gideon robô gigante', 8);
diario.anotar('Multi-urso', 5);

diario.exibirFichas();

const wendy = new Funcionario('Wendy', 'Caixa');
const soos = new Funcionario('Soos', 'Técnico de manutenção');

const cabana = new CabanaDoMisterio('Stanley Pines');

cabana.contratar(wendy);
cabana.contratar(soos);

cabana.abrirAsPortas();