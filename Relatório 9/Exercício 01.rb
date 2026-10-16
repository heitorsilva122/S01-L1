class CoquetelAfterlife
    attr_reader :nome
  
    def initialize(nome, preco)
      @nome = nome
      @preco = preco
    end
  
    def preco
      @preco
    end
  
    def preco=(valor)
      if valor.between?(5, 200)
        @preco = valor
      else
        puts "Preço inválido!"
      end
    end
  
    def ficha
      "#{@nome} - $#{@preco}"
    end
  end
  
  class DrinkDeLenda < CoquetelAfterlife
    attr_reader :lenda
  
    def initialize(nome, preco, lenda)
      super(nome, preco)
      @lenda = lenda
    end
  
    def ficha
      "#{super} (Homenagem a: #{@lenda})"
    end
  end
  
  drinks = [
    CoquetelAfterlife.new("Whiskey Sour", 30),
    DrinkDeLenda.new("Johnny's Shot", 150, "Johnny Silverhand"),
    DrinkDeLenda.new("Afterlife Special", 80, "Rogue Amendiares")
  ]
  
  drinks.each do |drink|
    puts drink.ficha
  end
  
  drinks[1].preco = 500
  drinks[1].preco = 80
  puts drinks[1].ficha

# tentativa de alterar o nome diretamente:
# drinks[0].nome = "Novo Nome"
# Erro: NoMethodError (undefined method 'nome=' for #<CoquetelAfterlife...>)
# isso acontece porque usei attr_reader para :nome, que gera só o método de leitura, nunca o de escrita
# sem um setter definido Ruby não permite atribuição externa a esse atributo.