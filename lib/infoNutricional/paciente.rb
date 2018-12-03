# Clase paciente que hereda de persona
class Paciente < Persona
  attr_reader :datosAntrop
  include Comparable

  def <=>(other)
    imc <=> other.imc
  end
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
  def imc
    datosAntrop.imc_value
  end
  def to_s
    "#{super} Estoy #{tratamiento}. Mis datos son #{datosAntrop.to_s}"
  end
end
