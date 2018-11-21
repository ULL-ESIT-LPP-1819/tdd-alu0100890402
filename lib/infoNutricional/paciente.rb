# require './datosAntrop'

class Paciente < Persona
  attr_reader :datosAntrop
  def initialize (nombre,apellido,edad,sexo,datosAntrop)
    super(nombre,apellido,edad,sexo)
    @datosAntrop = datosAntrop
  end
  def tratamiento
    if datosAntrop.imc_value >= 25
      "En tratamiento por #{datosAntrop.imc_descripcion}"
    else
      "Paciente sano"
    end
  end
end
