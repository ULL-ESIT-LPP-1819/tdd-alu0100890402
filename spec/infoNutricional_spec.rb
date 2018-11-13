RSpec.describe InfoNutricional do
  it "has a version number" do
    expect(InfoNutricional::VERSION).not_to be nil
  end

  describe Etiqueta do
    before :each do
      @etiqueta = Etiqueta.new("KitKat",27.6, 16, 61, 54.8, 6.5, 0.24)
    end

    describe "Existe la información obligatoria" do
      it "Debe existir un nombre para la etiqueta" do
        expect(@etiqueta.nombre).not_to be nil
      end
      it "Debe existir la cantidad de grasas" do
        expect(@etiqueta).to respond_to(:grasas)
        expect(@etiqueta.grasas).to eq(27.6)
      end
      it "Debe existir la cantidad de grasas saturadas" do
        expect(@etiqueta).to respond_to(:grasas_saturadas)
        expect(@etiqueta.grasas_saturadas).to eq(16)
      end
      it "Debe existir la cantidad de hidratos de carbono" do
        expect(@etiqueta).to respond_to(:hidratos)
        expect(@etiqueta.hidratos).to eq(61)
      end
      it "Debe existir la cantidad de azucares" do
        expect(@etiqueta).to respond_to(:azucar)
        expect(@etiqueta.azucar).to eq(54.8)
      end
      it "Debe existir la cantidad de proteinas" do
        expect(@etiqueta).to respond_to(:proteinas)
        expect(@etiqueta.proteinas).to eq(6.5)
      end
      it "Debe existir la cantidad de sal" do
        expect(@etiqueta).to respond_to(:sal)
        expect(@etiqueta.sal).to eq(0.24)
      end
    end
    describe "Existen métodos para obtener valores" do
      it "Existe un método para calcular el valor energético" do
        expect(@etiqueta).to respond_to(:valor_energetico)
      end
      it "Existe un metodo para obtener la IR de grasas" do
        expect(@etiqueta).to respond_to(:grasas_ir)
      end
      it "Existe un metodo para obtener la IR de grasas saturadas" do
        expect(@etiqueta).to respond_to(:grasas_saturadas_ir)
      end
      it "Existe un metodo para obtener la IR de hidratos" do
        expect(@etiqueta).to respond_to(:hidratos_ir)
      end
      it "Existe un metodo para obtener la IR de azucar" do
        expect(@etiqueta).to respond_to(:azucar_ir)
      end
      it "Existe un metodo para obtener la IR de proteinas" do
        expect(@etiqueta).to respond_to(:proteinas_ir)
      end
      it "Existe un metodo para obtener la IR de sal" do
        expect(@etiqueta).to respond_to(:sal_ir)
      end
      it "Existe un método para obtener la etiqueta formateada" do
        expect(@etiqueta).to respond_to(:formateado)
      end
    end
  end

  describe List do
    before :each do
      @lista = List.new
    end
    describe "Se crea el objeto correctamente" do
      it "Existe el objeto Nodo" do
        n = Node.new
        expect(n).not_to be nil
      end
      it "Se crea el objeto lista" do
        expect(@lista).not_to be nil
      end
      it "Se puede acceder al principio y final de la lista" do
        expect(@lista).to respond_to(:head)
        expect(@lista).to respond_to(:tail)
      end
    end
    describe "Existen métodos para manipularlo" do
      it "Existe un método que indica si la lista está vacía" do
        expect(@lista).to respond_to(:empty)
        expect(@lista.empty).to be true
      end
      context "para insertar nodos:" do
        before :each do
          @lista.insertar_front "initialized"
        end
        it "Existe un método para insertar por delante un nuevo elemento" do
          expect(@lista).to respond_to(:insertar_front)
          @lista.insertar_front 25
          expect(@lista.head.value).to eq 25
        end
        it "Existe un método para insertar por detras un nuevo elemento" do
          expect(@lista).to respond_to(:insertar_back)
          @lista.insertar_back "hello"
          expect(@lista.tail.value).to eq "hello"
        end
      end
      context "para eliminar nodos:" do
        before :each do
          @lista.insertar_back("back")
          @lista.insertar_front("front")
        end
        it "Existe un metodo para eliminar por delante un elemento" do
          expect(@lista).to respond_to(:pop_front)
          expect(@lista.pop_front).to eq "front"
          expect(@lista.head.value).to eq "back"
        end
        it "Existe un metodo para eliminar por detras un elemento" do
          expect(@lista).to respond_to(:pop_back)
          expect(@lista.pop_back).to eq "back"
          expect(@lista.head.value).to eq "front"
        end
      end
      context "para clasificar una lista por categoría (ej: sal)" do
        before :all do
          @listaEtiquetas = List.new
          @kitkat =  Etiqueta.new("KitKat",27.6, 16, 61, 54.8, 6.5, 0.24)

        end
        it "Se insertan las etiquetas correctamente en la lista" do
          @listaEtiquetas.insertar_front(@kitkat)
          expect(@listaEtiquetas.head.value).to be_an_instance_of Etiqueta
        end
      end
    end
  end

end
