from abc import ABC, abstractmethod

class Persona:
    def __init__(self, nome, arcano):
        self.nome = nome
        self.arcano = arcano

    def invocar(self):
        print(f"Persona invocada: {self.nome} (Arcano: {self.arcano})")


class Aliado:
    def __init__(self, nome, codinome):
        self.nome = nome
        self.codinome = codinome


class Lider:
    def __init__(self, codinome):
        self.codinome = codinome
        self.persona = Persona("Arsène", "Louco")
        self._equipe = []

    def recrutar(self, aliado):
        self._equipe.append(aliado)

    def infiltrar(self, palacio):
        print(f"Invadindo o Palácio de {palacio}...")
        self.persona.invocar()
        print("Equipe:")
        for aliado in self._equipe:
            print(f"{aliado.nome} ({aliado.codinome})")


if __name__ == "__main__":
    skull = Aliado("Ryuji Sakamoto", "Skull")
    panther = Aliado("Ann Takamaki", "Panther")

    joker = Lider("Joker")
    joker.recrutar(skull)
    joker.recrutar(panther)

    joker.infiltrar("Kamoshida")