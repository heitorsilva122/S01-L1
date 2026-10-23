class Pokemon {
    constructor(apelido, tipo, vidaInicial) {
        this.apelido = apelido;
        this.tipo = tipo;
        this.#vida = vidaInicial;
    }

    #vida;

    get vida() {
        return this.#vida;
    }

    sofrerDano(pontos) {
        this.#vida = Math.max(0, this.#vida - pontos);
        console.log(`${this.apelido} | Vida: ${this.#vida}`);
    }

    atacar(alvo) {
        console.log(`${this.apelido} usa um ataque genérico`);
        alvo.sofrerDano(10);
    }
}

class Squirtle extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Água', vidaInicial);
    }

    atacar(alvo) {
        console.log(`${this.apelido} usa Revolver D'gua`);
        alvo.sofrerDano(20);
    }
}

class Bulbasaur extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Planta', vidaInicial);
    }

    atacar(alvo) {
        console.log(`${this.apelido} usa Folha Navalha`);
        alvo.sofrerDano(15);
    }
}

const squirtle = new Squirtle('Tortuguita', 40);
const bulbasaur = new Bulbasaur('Crazy Frog', 30);

bulbasaur.atacar(squirtle);
squirtle.atacar(bulbasaur);
squirtle.atacar(bulbasaur);

console.log(`Vida final de ${squirtle.apelido}: ${squirtle.vida}`);
console.log(`Vida final de ${bulbasaur.apelido}: ${bulbasaur.vida}`);

// console.log(bulbasaur.#vida);
// SyntaxError: Private field '#vida' must be declared in an enclosing class