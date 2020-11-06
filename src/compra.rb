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
    if(@cesta.include?(producto)){
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

  comp1 = Compra.new('00001')
  obj = Maquillaje.new('prueba',[4, 5, 6, 7],10.0,5.0,[3, 2, 1, 7],TipoProducto::LABIOS,[['maria15','labios30'],[15,30]])
  obj2 = Maquillaje.new('hola',[1, 2, 3, 4],10.0,5.0,[3, 4, 2, 3],TipoProducto::LABIOS,[['maria15','labios30'],[15,30]])
  comp1.anadirCesta(obj).consultarPrecioDescontado()
  comp1.anadirCesta(obj2).consultarPrecioDescontado()
  comp1.calcularPrecioTotal()
end
