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

    def anadirProducto(producto)
      @productos.push(producto)
      return @productos.last()
    end

    def quitarProducto(producto)
      if(@productos.include?(producto))
        indice = @productos.index(producto)
        @productos.delete_at(indice);
      else
        raise ArgumentError.new('Este producto no está en el almacén')
      end
      return true
    end
end
