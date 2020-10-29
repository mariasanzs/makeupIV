require_relative 'tipoProducto.rb'


class Maquillaje
  attr_reader :nombre, :tonos, :precio , :unidades, :tipo
  attr_accessor :preciorebajado, :unidadesvendidas, :codigos

  def unidades=(unidades)
    if unidades.size-1 != @tonos.size-1
      raise ArgumentError.new('El número de elementos de unidades no coincide con el de tonos')
    end
    @unidades = unidades
  end

  #inicialización de la clase
  def initialize(nombre, tonos, precio, preciorebajado, unidades, tipo, codigos)
    @nombre = nombre
    @tonos = tonos
    @tipo = tipo
    @codigos = codigos #Array de códigos de descuento
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

  def venderProducto(tono)
    indice = @tonos.index(tono)
    if indice && @unidades[indice]-@unidadesvendidas[indice]>0
      @unidadesvendidas[indice] += 1
    else
      raise StandardError.new('Este tono no está')
    end
    return @unidadesvendidas[indice]
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
    porcentajeDescuento = 100.0-(@preciorebajado*100.0/@precio)
    if porcentajeDescuento <= 0
      raise StandardError.new('Este producto no tiene ningun descuento')
    end
    return porcentajeDescuento
  end

  def listarCaracteristicasProducto()
    cadena = " Detalles del producto:
    Nombre: #{@nombre}
    Tipo: #{@tipo}
    Tonos: #{@tonos}
    Tonos disponibles: #{tonosDisponibles()}
    Precio: #{@precio}
    Precio Rebajado: #{@preciorebajado}
    Ahorras un #{consultarPrecioDescontado()}%
    Unidades de cada tono: #{consultarUnidadesDisponibles()} \n"
    return cadena
  end

  def canjearCodigo(codigo)
    if @codigos.include?(codigo)
      @preciorebajado=0.85*@preciorebajado #Descuento del 15%
    else
      raise StandardError.new('Este código no es válido')
    end
    return @preciorebajado
  end

end
