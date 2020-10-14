require '../src/makeup.rb'

describe Maquillaje do
  obj = Maquillaje.new('prueba',[4, 5, 6, 7],10.0,5.0,[3, 2, 1, 7],[0, 0, 0, 7])

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
  end

  describe "#unidadesvendidas" do
    it "Debería devolver cuantas unidades se han vendido" do
      expect(obj.unidadesvendidas). to eql([0, 0, 0, 7])
    end
  end

  describe "#tonosDisponibles" do
    it "Debería devolver un listado de los tonos de los que hay unidades" do
      expect(obj.tonosDisponibles()). to eql([4, 5, 6])
    end
  end

  describe "#consultarUnidadesDisponibles" do
    it "Debería devolver cuantas unidades quedan de cada tono" do
      expect(obj.consultarUnidadesDisponibles()). to eql([3, 2, 1, 0])
    end
  end
end
