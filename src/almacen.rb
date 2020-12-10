require_relative 'makeup.rb'
require_relative 'compra.rb'

class Almacen
    attr_reader:productos

    def initialize()
      @productos = Array.new
    end
end
