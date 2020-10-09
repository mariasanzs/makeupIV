class Maquillaje
  attr_reader :nombre, :categoria, :tono, :preciorebajado
  #inicialización de la clase
  def initialize(nombre, categoria, tono, preciorebajado)
    @nombre = nombre
    @categoria = categoria
    @tono = tono
    @preciorebajado
  end

  #[HU04] - Consultar el precio rebajado #13
  def consultarPrecio()  

  end

  #[HU03] - Consultar tonos disponibles #12
  def consultarTonos()

  end

  #[HU02] - Poder listar todas las características de un producto #10
  def listarCaracteristicas()

  end

  #[HU01] - Consultar la categoria de un producto #9
  def consultarCategoria()

  end
end

obj = Maquillaje.new('lipStain','labiales','17','8')
