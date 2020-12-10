require_relative 'makeup.rb'
require_relative 'compra.rb'

class Almacen
    attr_reader:productos

    def initialize()
      @productos = Array.new
    end
    
    def buscarProducto(nombreproducto)
      for producto in @productos
        if producto.nombre == nombreproducto
          return producto
        end
      end
      raise StandardError.new('Este producto no está en el catálogo')
    end

end
