class Maquillaje
  attr_reader :nombre, :categoria, :tono, :preciorebajado
  #inicialización de la clase
  def initialize(nombre, categoria, tono, preciorebajado)
    @nombre = nombre
    @categoria = categoria
    @tono = tono
    @preciorebajado
  end
end

obj = Maquillaje.new('lipStain','labiales','17','8')
