require_relative '../src/almacen.rb'
require_relative '../src/compra.rb'

describe Maquillaje do
  obj = Maquillaje.new('prueba',[4, 5, 6, 7],10.0,5.0,[3, 2, 1, 7],TipoProducto::LABIOS,[['maria15','labios30'],[15,30]])
  obj2 = Maquillaje.new('prueba2',[1, 2, 3, 4],10.0,5.0,[3, 4, 2, 3],TipoProducto::LABIOS,[['maria15','labios30'],[15,30]])
  obj.venderProducto(5)
  obj.venderProducto(6)
  comp1 = Compra.new('00001')
  obj3 = Maquillaje.new('hola',[1, 2, 3, 4],10.0,5.0,[3, 4, 2, 3],TipoProducto::LABIOS,[['maria15','labios30'],[15,30]])
  almacen = Almacen.new()
  almacen.anadirProducto(obj)
  almacen.anadirProducto(obj3)

  describe "#nombre" do
    it "Debería devolver el nombre del producto" do
      expect(obj.nombre). to eql'prueba'
    end
  end

  describe "#tonos" do
    it "Debería devolver un listado de tonos que hay" do
      expect(obj.tonos). to eql([4, 5, 6, 7])
    end
  end

  describe "#tipo" do
    it "Debería de devolver qué tipo de producto de la lista es " do
      expect(obj.tipo). to eql(:labios)
    end
  end

  describe "#precio" do
    it "Debería devolver el precio que suele tener el producto" do
      expect(obj.precio). to eql(10.0)
    end
  end

  describe "#codigos" do
    it "Debería devolver los codigos de descuento de un producto" do
      expect(obj.codigos). to eql([['maria15','labios30'],[15,30]])
    end
  end

  describe "#preciorebajado" do
    it "Debería devolver el precio rebajado que tiene" do
      expect(obj.preciorebajado). to eql(5.0)
    end
  end

  describe "#unidades" do
    it "Debería devolver cuantas unidades han puesto de cada tono" do
      expect(obj.unidades). to eql([3, 2, 1, 7])
    end

    it 'Debería lanzar ArgumentError si el numero de elementos de unidades no coincide con el de tonos' do
      expect{ objexc = Maquillaje.new('prueba_exc',[1, 2, 3, 4],10.0,5.0,[5, 5, 2]) }.to raise_error(ArgumentError)
    end
  end

  describe "#venderProducto" do
    it "Debería devolver cuantas unidades lleva vendidas de ese tono" do
      expect(obj2.venderProducto(4)). to eql(1)
    end

    it "Debería lanzar error si no estuviera ese tono" do
      expect{ obj2.venderProducto(10) }.to raise_error(StandardError)
    end
  end

  describe "#initialize" do
    it "Debería lanzar ArgumentError si el preciorebajado es > que el precio normal" do
      expect{ objexc = Maquillaje.new('prueba_exc',[1, 2, 3, 4],1.0,5.0,[5, 5, 2,2],TipoProducto::LABIOS) }.to raise_error(ArgumentError)
    end
  end

  describe "#unidadesvendidas" do
    it "Debería devolver cuantas unidades se han vendido" do
      expect(obj.unidadesvendidas). to eql([0, 1, 1, 0])
    end
  end

  describe "#consultarUnidadesDisponibles" do
    it "Debería devolver cuantas unidades quedan de cada tono" do
      expect(obj.consultarUnidadesDisponibles()). to eql([3, 1, 0, 7])
    end
  end

  describe "#tonosDisponibles" do
    it "Debería devolver un listado de los tonos de los que hay unidades" do
      expect(obj.tonosDisponibles()). to eql([4, 5, 7])
    end
  end

  obj2.preciorebajado = 20.0

  describe "#consultarPrecioDescontado" do
    it "Debería devolver el % de descuento que hay" do
      expect(obj.consultarPrecioDescontado()). to eql(50.0)
    end

    it "Debería lanzar error si no tuviera ningún descuento" do
      expect{ obj2.consultarPrecioDescontado() }.to raise_error(StandardError)
    end
  end


  describe "#listarCaracteristicasProducto" do
    it "Debería devolver cuantas unidades se han vendido" do
      expect(obj.listarCaracteristicasProducto()). to eql(" Detalles del producto:
    Nombre: prueba
    Tipo: labios
    Tonos: [4, 5, 6, 7]
    Tonos disponibles: [4, 5, 7]
    Precio: 10.0
    Precio Rebajado: 5.0
    Ahorras un 50.0%
    Unidades de cada tono: [3, 1, 0, 7] \n")
    end
  end

  describe "#canjearCodigo" do
    it "Debería devolver el nuevo precio rebajado" do
      expect( obj.canjearCodigo('maria15')).to eql(4.25)
    end

    it "Debería lanzar error si no existiera ningún código descuento" do
      expect{ obj.canjearCodigo('fallo') }.to raise_error(StandardError)
    end
  end

  describe "#cliente" do
    it "Debería devolver el id del cliente" do
      expect(comp1.cliente). to eql'00001'
    end
  end

  describe "#anadirCesta" do
    it "Debería devolver el nuevo producto añadido" do
      expect(comp1.anadirCesta(obj).listarCaracteristicasProducto). to eql(" Detalles del producto:
    Nombre: prueba
    Tipo: labios
    Tonos: [4, 5, 6, 7]
    Tonos disponibles: [4, 5, 7]
    Precio: 10.0
    Precio Rebajado: 4.25
    Ahorras un 57.5%
    Unidades de cada tono: [3, 1, 0, 7] \n")
    end
  end

  comp1.anadirCesta(obj)
  comp1.anadirCesta(obj3)

  describe "#quitarCesta" do
    it "Debería devolver el nuevo producto añadido" do
      expect(comp1.quitarCesta(obj)). to eql(true)
    end

    it "Debería lanzar error si no existiera ese producto en la cesta" do
      expect{ comp1.quitarCesta(obj2) }.to raise_error(ArgumentError)
    end
  end

  describe "#calcularPrecioTotal" do
    it "Debería devolver el precio total de los productos de la cesta" do
      expect(comp1.calcularPrecioTotal()). to eql(9.25)
    end
  end

  describe "#buscarProducto" do
    it "Debería devolver el producto que buscamos" do
      expect(almacen.buscarProducto(obj3.nombre)). to eql(obj3)
    end

    it "Debería lanzar error si no estuviera el producto en el catálogo" do
      expect{ almacen.buscarProducto(obj2.nombre)}.to raise_error(StandardError)
    end
  end

  describe "#anadirProducto" do
    it "Debería añadir un producto al almacen" do
      expect(almacen.anadirProducto(obj2)). to eql(obj2)
    end
  end

  describe "#quitarProducto" do
    it "Debería quitar un producto al almacen" do
      expect(almacen.quitarProducto(obj3)). to eql(true)
    end

    it "Debería lanzar error si no estuviera el producto en la cesta" do
      expect{ almacen.buscarProducto(obj2)}.to raise_error(StandardError)
    end
  end

end
