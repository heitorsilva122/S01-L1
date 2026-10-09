from abc import ABC, abstractmethod

class HeroiOverwatch:
    def __init__(self, codinome, funcao):
        self.codinome = codinome
        self.funcao = funcao

    def usar_suprema(self):
        print(f"{self.codinome} usa sua suprema!")


class HeroiTanque(HeroiOverwatch):
    def usar_suprema(self):
        print(f"{self.codinome} ativa sua suprema e avança protegendo a equipe!")


class HeroiSuporte(HeroiOverwatch):
    def usar_suprema(self):
        print(f"{self.codinome} ativa sua suprema de cura em área!")

    def curar_equipe(self):
        print(f"{self.codinome} está curando a equipe!")


if __name__ == "__main__":
    herois = [
        HeroiTanque("Reinhardt", "Tanque"),
        HeroiSuporte("Mercy", "Suporte"),
        HeroiOverwatch("Soldier: 76", "Dano")
    ]

    for heroi in herois:
        heroi.usar_suprema()
        if isinstance(heroi, HeroiSuporte):
            heroi.curar_equipe()