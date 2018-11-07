require "infoNutricional/version"

module InfoNutricional
  class Error < StandardError; end

  class Etiqueta
    attr_reader :nombre, :grasas, :grasas_saturadas, :hidratos
    def initialize(nombre, grasas, grasas_saturadas, hidratos)
      @nombre, @grasas, @grasas_saturadas, @hidratos = nombre, grasas, grasas_saturadas, hidratos
    end
  end

end
