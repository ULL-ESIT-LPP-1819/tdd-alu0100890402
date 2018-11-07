require "infoNutricional/version"

module InfoNutricional
  class Error < StandardError; end

  class Etiqueta
    attr_reader :nombre,:grasas,:grasas_saturadas,:hidratos,:azucar,:proteinas,:sal
    def initialize(nombre, grasas, grasas_saturadas, hidratos, azucar, proteinas, sal)
      @nombre, @grasas, @grasas_saturadas, @hidratos = nombre, grasas, grasas_saturadas, hidratos
      @azucar, @proteinas, @sal = azucar, proteinas, sal
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
      (@grasas / 70) * 100
    end
    def grasas_saturadas_ir
      (@grasas_saturadas / 20) * 100
    end
    def hidratos_ir
      (@hidratos / 260) * 100
    end
    def azucar_ir
      (@azucar / 90) * 100
    end
    def proteinas_ir
      (@proteinas / 50) * 100
    end
    def sal_ir
      (@sal / 6) * 100
    end

#     def formateada
# "Producto: #{nombre} |  Por 100g  |  IR%
# "
#
#     end
  end

end
