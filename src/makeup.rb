class Maquillaje
  attr_reader :nombre, :categoria, :tono, :preciorebajado
  #inicialización de la clase
  def initialize(nombre, categoria, tonos, precio, preciorebajado)
    @nombre = nombre
    @categoria = categoria
    @tonos = tonos
    @precio = precio
    @preciorebajado = preciorebajado
  end


  def consultarPrecioDescontado()

  end

  def consultarTonos()

  end

  def listarCaracteristicasProducto()

  end

  def consultarCategoria()

  end
end

#obj = Maquillaje.new('lipStain','labiales','17','8')
