RSpec.describe InfoNutricional do
  it "has a version number" do
    expect(InfoNutricional::VERSION).not_to be nil
  end

  describe InfoNutricional::Etiqueta do
    before :each do
      @etiqueta = InfoNutricional::Etiqueta.new("KitKat")
    end

    describe "Existe la información obligatoria" do
      it "Debe existir un nombre para la etiqueta" do
        expect(@etiqueta.nombre).not_to be_empty
      end
    end
  end
end
