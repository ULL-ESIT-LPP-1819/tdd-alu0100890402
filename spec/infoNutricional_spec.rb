RSpec.describe InfoNutricional do
  it "has a version number" do
    expect(InfoNutricional::VERSION).not_to be nil
  end

  describe InfoNutricional::Etiqueta do
    before :each do
      @etiqueta = InfoNutricional::Etiqueta.new("KitKat",27.6, 16, 61, 54.8, 6.5, 0.24)
    end

    describe "Existe la información obligatoria" do
      it "Debe existir un nombre para la etiqueta" do
        expect(@etiqueta.nombre).not_to be_empty
      end
      it "Debe existir la cantidad de grasas" do
        expect(@etiqueta).to respond_to(:grasas)
      end
      it "Debe existir la cantidad de grasas saturadas" do
        expect(@etiqueta).to respond_to(:grasas_saturadas)
      end
      it "Debe existir la cantidad de hidratos de carbono" do
        expect(@etiqueta).to respond_to(:hidratos)
      end
      it "Debe existir la cantidad de azucares" do
        expect(@etiqueta).to respond_to(:azucar)
      end
      it "Debe existir la cantidad de proteinas" do
        expect(@etiqueta).to respond_to(:proteinas)
      end
      it "Debe existir la cantidad de sal" do
        expect(@etiqueta).to respond_to(:sal)
      end
    end
    describe "Existen métodos para obtener valores" do
      it "Existe un método para calcular el valor energético" do
        expect(@etiqueta).to respond_to(:valor_energetico)
      end
    end
  end
end
