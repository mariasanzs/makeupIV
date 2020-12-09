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
          puts producto
          return producto
        else
          raise StandardError.new('Este producto no está en el catálogo')
        end
      end
    end

    def anadirProducto(producto)
      @productos.push(producto)
      puts @productos
      return @productos.last()
    end

    def quitarProducto(producto)
      if(@productos.include?(producto))
        indice = @productos.index(producto)
        @productos.delete_at(indice);
        puts @productos
      else
        raise ArgumentError.new('Este producto no está en el almacén')
      end
      return true
    end
end
