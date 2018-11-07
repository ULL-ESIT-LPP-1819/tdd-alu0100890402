require "infoNutricional/version"

module InfoNutricional
  class Error < StandardError; end

  class Etiqueta
    attr_reader :nombre
    def initialize(nombre)
      @nombre = nombre
    end
  end

end
