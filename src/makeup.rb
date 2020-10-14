class Maquillaje
  attr_reader :nombre, :tonos, :precio, :unidades
  attr_accessor :preciorebajado, :unidadesvendidas

  def unidades=(unidades)
    if unidades.size-1 != @tonos.size-1
      raise ArgumentError.new('El número de elementos de unidades no coincide con el de tonos')
    end
    @unidades = unidades
  end

  #inicialización de la clase
  def initialize(nombre, tonos, precio, preciorebajado, unidades)
    @nombre = nombre
    @tonos = tonos
    if precio < preciorebajado
      raise ArgumentError.new('Este producto es más caro de su precio normal')
    end
    @precio = precio
    @preciorebajado = preciorebajado
    self.unidades = unidades
    @unidadesvendidas = Array.new
    for i in 0..(@tonos.size-1)
      @unidadesvendidas << 0
    end
  end

  def tonosDisponibles()
    disponibleTono = Array.new
    for i in 0..(@tonos.size-1)
      if @unidades[i] > @unidadesvendidas[i]
        disponibleTono << @tonos[i]
      end
    end
    return disponibleTono
  end

  def consultarUnidadesDisponibles()
    unidadesxtono = Array.new
    for i in 0..(@unidades.size-1)
      unidadesxtono << @unidades[i]-@unidadesvendidas[i]
    end
    return unidadesxtono
  end

  def consultarPrecioDescontado()
    porcentajeDescuento = (@preciorebajado/@precio)*100
    #Ahorras un #{porcentajeDescuento}%"
    return porcentajeDescuento
  end

  def listarCaracteristicasProducto()
    cadena = " Detalles del producto:
    Nombre: #{@nombre}
    Tonos: #{@tonos}
    Tonos disponibles: #{tonosDisponibles()}
    Precio: #{@precio}
    Precio Rebajado: #{@preciorebajado}
    Ahorras un #{consultarPrecioDescontado()}%
    Unidades de cada tono: #{consultarUnidadesDisponibles()} \n"
    return cadena
  end

  #obj = Maquillaje.new('prueba',[4, 5, 6, 7],10.0,5.0,[3, 2, 1, 7])
  #obj.consultarPrecioDescontado()
  #obj.listarCaracteristicasProducto()
  #obj.tonosDisponibles()
  #obj.consultarUnidadesDisponibles()

end
