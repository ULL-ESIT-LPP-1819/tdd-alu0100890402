require "infoNutricional/version"

module InfoNutricional
  class Error < StandardError; end

  class Etiqueta
    attr_reader :nombre, :grasas, :grasas_saturadas
    def initialize(nombre, grasas, grasas_saturadas)
      @nombre, @grasas, @grasas_saturadas = nombre, grasas, grasas_saturadas
    end
  end

end
