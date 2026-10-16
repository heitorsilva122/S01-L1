module Depoente
    def depor
      raise NotImplementedError, "ERRO"
    end
  end
  
  module Detive
    def ser_detido
      puts "#{nome} foi levado pela Scotland Yard!"
    end
  end
  
  class Envolvido
    attr_reader :nome
  
    def initialize(nome)
      @nome = nome
    end
  end
  
  class TestemunhaOcular < Envolvido
    include Depoente
  
    def depor
      puts "#{nome} viu o suspeito fugindo pela janela"
    end
  end
  
  class SuspeitoDoCrime < Envolvido
    include Depoente
    include Detive
  
    def depor
      puts "#{nome} alega que estava em dormindo na hora do crime"
    end
  end
  
  class Investigacao
    def initialize(caso)
      @caso = caso
      @envolvidos = []
    end
  
    def registrar(envolvido)
      @envolvidos << envolvido
    end
  
    def ouvir_todos
      puts "Caso: #{@caso}"
      @envolvidos.each do |envolvido|
        envolvido.depor
      end
    end
  
    def acionar_scotland_yard
      detidos = @envolvidos.select { |envolvido| envolvido.respond_to?(:ser_detido) }
      detidos.each do |envolvido|
        envolvido.ser_detido
      end
    end
  end
  
  testemunha = TestemunhaOcular.new("Dr. Watson")
  suspeito1 = SuspeitoDoCrime.new("James Moriarty")
  suspeito2 = SuspeitoDoCrime.new("Sebastian Moran")
  
  investigacao = Investigacao.new("O Mistério da Baker Street")
  
  investigacao.registrar(testemunha)
  investigacao.registrar(suspeito1)
  investigacao.registrar(suspeito2)
  
  investigacao.ouvir_todos
  investigacao.acionar_scotland_yard