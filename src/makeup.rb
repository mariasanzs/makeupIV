class Maquillaje
  attr_accessor :nombre, :tono, :preciorebajado, :precio, :unidades, :unidadesvendidas
  #inicialización de la clase
  def initialize(nombre, tonos, precio, preciorebajado, unidades, unidadesvendidas)
    @nombre = nombre
    @tonos = tonos
    @precio = precio
    @preciorebajado = preciorebajado
    @unidades = unidades
    @unidadesvendidas = unidadesvendidas
  end

  def consultarTonos()

  end

  def listarCaracteristicasProducto()

  end

  def consultarUnidadesDisponibles()

  end

  def consultarPrecioDescontado()
    porcentajeDescuento = (@preciorebajado/@precio)*100
    #Ahorras un #{porcentajeDescuento}%"
    return porcentajeDescuento
  end

end
