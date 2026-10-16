class PhoneWave
    def enviar_dmail(mensagem)
      puts "Mensagem: #{mensagem}"
      puts "D-Mail enviado para o passado!"
    end
  end
  
  class MembroDoLab
    attr_reader :numero, :nome
  
    def initialize(numero, nome)
      @numero = numero
      @nome = nome
    end
  end
  
  class LaboratorioDeGadgets
    def initialize
      # composição: o PhoneWave é criado dentro do initialize do
      # LaboratorioDeGadgets, ele nasce junto com o laboratório e só
      # existe dentro dele
      @phonewave = PhoneWave.new
      @membros = []
    end
  
    def admitir(membro)
      # agregação: o membro já existia antes de ser admitido e é apenas
      # adicionado aqui, continuando a existir independentemente do
      # laboratório
      @membros << membro
      puts "Lab Mem #{membro.numero}: #{membro.nome}"
    end
  
    def experimento(mensagem)
      @membros.each do |membro|
        puts "Lab Mem #{membro.numero}: #{membro.nome}"
      end
      @phonewave.enviar_dmail(mensagem)
    end
  end
  
  okabe = MembroDoLab.new("001", "Rintarou Okabe")
  mayuri = MembroDoLab.new("002", "Mayuri Shiina")
  
  laboratorio = LaboratorioDeGadgets.new
  
  laboratorio.admitir(okabe)
  laboratorio.admitir(mayuri)
  
  laboratorio.experimento("El Psy Kongroo")