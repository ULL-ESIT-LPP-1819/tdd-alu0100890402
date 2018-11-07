require "infoNutricional/version"

module InfoNutricional
  class Error < StandardError; end

  class Etiqueta
    attr_reader :nombre,:grasas,:grasas_saturadas,:hidratos,:azucar,:proteinas,:sal
    def initialize(nombre, grasas, grasas_saturadas, hidratos, azucar, proteinas, sal)
      @nombre, @grasas, @grasas_saturadas, @hidratos = nombre, grasas, grasas_saturadas, hidratos
      @azucar, @proteinas, @sal = azucar, proteinas, sal
    end
  end

end
