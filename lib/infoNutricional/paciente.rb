# require './datosAntrop'

class Paciente < Persona
  attr_reader :datosAntrop
  def initialize (nombre,apellido,edad,sexo,peso,talla,cintura,cadera)
    super(nombre,apellido,edad,sexo)
    @datosAntrop = DatosAntrop.new(peso,talla,edad,sexo,cintura,cadera)
  end
  def tratamiento
    if datosAntrop.imc_value >= 25
      "en tratamiento por #{datosAntrop.imc_descripcion}"
    else
      "sano"
    end
  end
  def to_s
    "#{super} Estoy #{tratamiento}."
  end
end
