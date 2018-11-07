require "infoNutricional/version"

module InfoNutricional
  class Error < StandardError; end

  class Etiqueta
    attr_reader :nombre, :grasas
    def initialize(nombre, grasas)
      @nombre, @grasas = nombre, grasas
    end
  end

end
