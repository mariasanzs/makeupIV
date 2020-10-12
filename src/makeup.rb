class Maquillaje
  attr_reader :nombre, :categoria, :tono, :preciorebajado
  #inicialización de la clase
  def initialize(nombre, categoria, tonos, preciorebajado)
    @nombre = nombre
    @categoria = categoria
    @tonos = tonos
    @preciorebajado = preciorebajado
  end


  def consultarPrecio()

  end

  def consultarTonos()

  end

  def listarCaracteristicasProducto()

  end

  def consultarCategoria()

  end
end

#obj = Maquillaje.new('lipStain','labiales','17','8')
