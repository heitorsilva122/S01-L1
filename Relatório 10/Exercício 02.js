class Pistola {
    constructor(modelo) {
        this.modelo = modelo;
    }
}

class AgenteProtocolo {
    #pistola;

    constructor(codinome, modeloDaPistola) {
        this.codinome = codinome;
        this.#pistola = new Pistola(modeloDaPistola);
    }

    usarHabilidade() {
        throw new Error('Habilidade não implementada para este agente');
    }

    entrarEmCombate() {
        console.log(`${this.codinome} | Pistola: ${this.#pistola.modelo} | ${this.usarHabilidade()}`);
    }
}

class Controlador extends AgenteProtocolo {
    usarHabilidade() {
        return 'lança uma fumaça para bloquear a visão inimiga';
    }
}

class Iniciador extends AgenteProtocolo {
    usarHabilidade() {
        return 'arremessa um flash para cegar os inimigos';
    }
}

class Duelista extends AgenteProtocolo {
    usarHabilidade() {
        return 'ativa uma suprema de dano em área';
    }
}

class Esquadrao {
    #agentes;

    constructor(nome, agentes) {
        this.nome = nome;
        this.#agentes = agentes;
    }

    iniciarPartida() {
        console.log(`Esquadrão ${this.nome} entrando em partida!`);
        this.#agentes.forEach(agente => agente.entrarEmCombate());
    }

    listarControladores() {
        return this.#agentes.filter(agente => agente instanceof Controlador);
    }
}

const controlador1 = new Controlador('Astra', 'Ghost');
const controlador2 = new Controlador('Viper', 'Classic');
const iniciador = new Iniciador('Sova', 'Sheriff');
const duelista = new Duelista('Jett', 'Frenzy');

const esquadrao = new Esquadrao('Protocolo Alpha', [controlador1, controlador2, iniciador, duelista]);

esquadrao.iniciarPartida();

esquadrao.listarControladores().forEach(controlador => {
    console.log(controlador.codinome);
});

const agenteGenerico = new AgenteProtocolo('Desconhecido', 'Classic');
// agenteGenerico.entrarEmCombate();
// Error: Habilidade não implementada para este agente