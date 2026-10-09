from abc import ABC, abstractmethod


class IUnidadeDeRede(ABC):
    @abstractmethod
    def executar_invasao(self):
        pass


class Cyberdeck:
    def __init__(self, modelo):
        self.modelo = modelo


class OperadorNetrunner(IUnidadeDeRede):
    def __init__(self, nome, modelo_cyberdeck):
        self.nome = nome
        self.cyberdeck = Cyberdeck(modelo_cyberdeck)

    def executar_invasao(self):
        print(f"{self.nome} usa o Cyberdeck {self.cyberdeck.modelo} para quebrar o ICE de um servidor!")


class DroneDeVigilancia(IUnidadeDeRede):
    def __init__(self, codigo):
        self.codigo = codigo

    def executar_invasao(self):
        print(f"Drone {self.codigo} intercepta o sinal da rede!")


class CelulaHacker:
    def __init__(self, nome, membros: list[IUnidadeDeRede]):
        self.nome = nome
        self._membros = membros

    def iniciar_ataque(self):
        print(f"Célula {self.nome} iniciando ataque coordenado!")
        for membro in self._membros:
            membro.executar_invasao()


if __name__ == "__main__":
    netrunner = OperadorNetrunner("V", "Militech Paraline")
    drone = DroneDeVigilancia("DV-07")

    celula = CelulaHacker("Night Rats", [netrunner, drone])
    celula.iniciar_ataque()