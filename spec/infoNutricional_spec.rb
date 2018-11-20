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
      context "para imprimirlo por pantalla" do
        it "si la lista está vacía" do
          expect(@lista.empty).to be true
          expect(@lista.to_s).to eq "H -> nil <- T"
        end
        it "si la lista tiene elementos" do
          @lista.insertar_front 1
          @lista.insertar_front 2
          expect(@lista.to_s).to eq "H -> 1 <-> 2 <- T"
        end
      end
      context "para clasificar una lista por categoría (ej: sal)" do
        before :all do
          @listaEtiquetas = List.new
          @sal_alta, @sal_baja = [], []
          @kitkat = Etiqueta.new("KitKat",27.6, 16, 61, 54.8, 6.5, 0.24)
          @snickers = Etiqueta.new("Snickers",19.4, 10.2, 34.5, 26.3, 5.8, 0.22)
          @pringles =  Etiqueta.new("Pringles",33, 9.6, 52.7, 2.6, 4, 0.592)
          @doritos =  Etiqueta.new("Doritos",25.8, 12.5, 61, 3.5, 7.6, 0.382)
          @jamon =  Etiqueta.new("Jamon Serrano",22.2, 6.53, 0.5, 0.4, 33.2, 3.1)
        end
        it "Se insertan las etiquetas correctamente en la lista" do
          @listaEtiquetas.insertar_front(@kitkat)
          @listaEtiquetas.insertar_front(@snickers)
          @listaEtiquetas.insertar_front(@pringles)
          @listaEtiquetas.insertar_front(@doritos)
          @listaEtiquetas.insertar_front(@jamon)
          expect(@listaEtiquetas.head.value).to be_an_instance_of Etiqueta
          expect(@listaEtiquetas.tail.value).to be_an_instance_of Etiqueta
        end
        it "Se eliminan las etiquetas de la lista al sacarlas" do
          until @listaEtiquetas.empty
            el = @listaEtiquetas.pop_front
            if (el.sal > 0.3)
              @sal_alta.push el
            else
              @sal_baja.push el
            end
          end
          expect(@listaEtiquetas.empty).to be true
        end
        it "Se guardan los valores correctamente clasificados" do
          expect(@sal_baja.length).to eq 2
          expect(@sal_alta.length).to eq 3
        end
      end
    end
  end

  # describe Valoracion do
  # end
end
