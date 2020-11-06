require_relative 'makeup.rb'

class Compra
  attr_reader :cliente
  attr_accessor :cesta

  def initialize(cliente)
    @cliente = cliente
    @cesta = []
  end

  def anadirCesta(producto)
    @cesta.push(producto)
    return @cesta.last()
  end

  def quitarCesta(producto)
    if(@cesta.include?(producto))
      indice = @cesta.index(producto)
      @cesta.delete_at(indice);
    else
      raise ArgumentError.new('Este producto no está en tu cesta')
    end
    return true
  end

  def calcularPrecioTotal()
    total = 0
    for i in 0..(@cesta.size-1)
      total += @cesta[i].preciorebajado
    end
    return total
  end

end
