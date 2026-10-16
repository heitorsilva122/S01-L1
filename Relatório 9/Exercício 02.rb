class Instrumentista
    attr_reader :nome, :instrumento
  
    def initialize(nome, instrumento)
      @nome = nome
      @instrumento = instrumento
    end
  
    def interpretar(peca)
      raise NotImplementedError, "ERRO"
    end
  end
  
  class Solista < Instrumentista
    def interpretar(peca)
      puts "#{@nome} (#{@instrumento}) conduz a melodia principal de '#{peca}'"
    end
  end
  
  class Acompanhador < Instrumentista
    def interpretar(peca)
      puts "#{@nome} (#{@instrumento}) acompanha o ritmo do solista em '#{peca}'"
    end
  end
  
  class Regente
    def initialize(nome)
      @nome = nome
      @orquestra = []
    end
  
    def convocar(instrumentista)
      @orquestra << instrumentista
    end
  
    def reger(peca)
      puts "Regente #{@nome} conduzindo '#{peca}'"
      @orquestra.each do |instrumentista|
        instrumentista.interpretar(peca)
      end
    end
  
    def escalacao
      @orquestra.map do |instrumentista|
        "#{instrumentista.class}: #{instrumentista.nome}"
      end
    end
  end
  
  # Main
  solista = Solista.new("Kousei Arima", "Piano")
  acompanhador = Acompanhador.new("Kaori Miyazono", "Violino")
  regente = Regente.new("Maestro Takeda")
  
  regente.convocar(solista)
  regente.convocar(acompanhador)
  
  regente.reger("Rondo Capriccioso")
  
  regente.escalacao.each do |texto|
    puts texto
  end
  
  # criando um Instrumentista diretamente e chamando interpretar:
  instrumentista_generico = Instrumentista.new("Anônimo", "Flauta")
  # instrumentista_generico.interpretar("peça qualquer")
  # Erro: NotImplementedError (Subclasses devem implementar o método interpretar)
  # o objeto é criado normalmente
  # o erro só acontece quando o método interpretar é chamado, porque o
  # corpo dele é só um "raise", sem um mecanismo de linguagem dedicado.