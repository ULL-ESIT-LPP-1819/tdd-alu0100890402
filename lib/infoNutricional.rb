require "infoNutricional/version"

module InfoNutricional
  class Error < StandardError; end

  class Etiqueta
    attr_reader :nombre,:grasas,:grasas_saturadas,:hidratos,:azucar,:proteinas,:sal
    def initialize(nombre, grasas, grasas_saturadas, hidratos, azucar, proteinas, sal)
      @nombre, @grasas, @grasas_saturadas, @hidratos = nombre, grasas.to_f, grasas_saturadas.to_f, hidratos.to_f
      @azucar, @proteinas, @sal = azucar.to_f, proteinas.to_f, sal.to_f
    end

    def valor_energetico
      "#{val_energ_kjul} kJ; #{val_energ_kcal} kcal"
    end
    def val_energ_kcal
      @grasas * 9 + @hidratos * 4 + @proteinas * 4 + @sal * 6
    end
    def val_energ_kjul
      @grasas * 37 + @hidratos * 17 + @proteinas * 17 + @sal * 25
    end
    def grasas_ir
      ((@grasas / 70) * 100).round(2)
    end
    def grasas_saturadas_ir
      ((@grasas_saturadas / 20) * 100).round(2)
    end
    def hidratos_ir
      ((@hidratos / 260) * 100).round(2)
    end
    def azucar_ir
      ((@azucar / 90) * 100).round(2)
    end
    def proteinas_ir
      ((@proteinas / 50) * 100).round(2)
    end
    def sal_ir
      ((@sal / 6) * 100).round(2)
    end
    def val_energ_kcal_ir
      ((val_energ_kcal / 2000) * 100).round(2)
    end
    def val_energ_kjul_ir
      ((val_energ_kcal / 8400) * 100).round(2)
    end
    def formateado
"Producto: #{nombre}  |   Por 100g     |   IR%
 Valor energético  |   #{val_energ_kcal} kcal  |  #{val_energ_kcal_ir}%
                   |   #{val_energ_kjul} kJul  |  #{val_energ_kjul_ir}%
     Grasas        |     #{grasas} g     |  #{grasas_ir}%
    saturadas      |     #{grasas_saturadas} g     |  #{grasas_saturadas_ir}%
    Hidratos       |     #{hidratos} g     |  #{hidratos_ir}%
    azucares       |     #{azucar} g     |  #{azucar_ir}%
    Proteinas      |      #{proteinas} g     |  #{proteinas_ir}%
       Sal         |     #{sal} g     |   #{sal_ir}%"
    end
  end

end
