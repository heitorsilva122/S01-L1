class UsuarioDeNen {
    constructor(nome) {
        this.nome = nome;
    }

    atacar(alvo) {
        console.log(`${this.nome} ataca ${alvo.nome} com um golpe genérico de aura!`);
    }
}

class Intensificador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} reforça o corpo com aura e desfere um soco avassalador em ${alvo.nome}!`);
    }
}

class Transmutador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} transforma sua aura em eletricidade e atinge ${alvo.nome}!`);
    }
}

class Materializador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} materializa sua corrente e lança contra ${alvo.nome}!`);
    }
}

class Aranha {
    constructor(nome, numero) {
        this.nome = nome;
        this.numero = numero;
    }
}

class TrupeFantasma {
    #aranhas;

    constructor(cidade, aranhas = []) {
        this.cidade = cidade;
        this.#aranhas = aranhas;
    }

    revelarAranhas() {
        console.log(`Trupe Fantasma avistada em ${this.cidade}`);
        this.#aranhas.forEach(aranha => {
            console.log(`${aranha.numero} - ${aranha.nome}`);
        });
    }

    buscarAranha(numero) {
        return this.#aranhas.find(aranha => aranha.numero === numero);
    }
}

const feitan = new Aranha('Feitan', 4);
const phinks = new Aranha('Phinks', 7);

const trupe = new TrupeFantasma('Yorknew City', [feitan, phinks]);

trupe.revelarAranhas();

const alvo = trupe.buscarAranha(4);

const hunters = [
    new Intensificador('Gon Freecss'),
    new Transmutador('Killua Zoldyck'),
    new Materializador('Kurapika')
];

hunters.forEach(hunter => {
    hunter.atacar(alvo);
});