require_relative '../src/makeup.rb'

describe Maquillaje do
  obj = Maquillaje.new('prueba',[4, 5, 6, 7],10.0,5.0,[3, 2, 1, 7])
  obj2 = Maquillaje.new('prueba',[1, 2, 3, 4],10.0,5.0,[3, 4, 2, 3])
  obj.venderProducto(5)
  obj.venderProducto(6)

  describe "#nombre" do
    it "Debería devolver el nombre del producto" do
      expect(obj.nombre). to eql'prueba'
    end
  end

  describe "#tono" do
    it "Debería devolver un listado de tonos que hay" do
      expect(obj.tonos). to eql([4, 5, 6, 7])
    end
  end

  describe "#precio" do
    it "Debería devolver el precio que suele tener el producto" do
      expect(obj.precio). to eql(10.0)
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
      expect{ objexc = Maquillaje.new('prueba_exc',[1, 2, 3, 4],1.0,5.0,[5, 5, 2,2]) }.to raise_error(ArgumentError)
    end
  end

  describe "#unidadesvendidas" do
    it "Debería devolver cuantas unidades se han vendido" do
      expect(obj.unidadesvendidas). to eql([0, 1, 1, 0])
    end
  end

end
