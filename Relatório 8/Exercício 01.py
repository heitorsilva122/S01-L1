from abc import ABC, abstractmethod

class MortoVivo:
    def __init__(self, nome, almas, estus):
        self.nome = nome
        self._almas = almas
        self.__estus = estus

    def get_estus(self):
        return self.__estus

    def set_estus(self, quantidade):
        if 0 <= quantidade <= 10:
            self.__estus = quantidade
        else:
            print("Quantidade de Estus inválida!")

    def mostrar_status(self):
        return f"Morto-vivo {self.nome} | Almas: {self._almas} | Estus: {self.__estus}"


class Clerigo(MortoVivo):
    def __init__(self, nome, almas, estus, milagre):
        super().__init__(nome, almas, estus)
        self.milagre = milagre

    def mostrar_status(self):
        status_base = super().mostrar_status()
        return f"{status_base} | Milagre: {self.milagre}"


if __name__ == "__main__":
    clerigo = Clerigo("Radahn", 1500, 3, "Cura Maior")
    print(clerigo.mostrar_status())

    clerigo.set_estus(15)
    clerigo.set_estus(10)
    print(clerigo.mostrar_status())