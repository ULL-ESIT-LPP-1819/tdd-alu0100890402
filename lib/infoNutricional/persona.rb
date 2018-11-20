class Persona
  attr_reader :nombre,:apellido,:edad,:sexo
  def initialize(nombre, apellido,edad,sexo)
    @nombre,@apellido,@edad,@sexo = nombre,apellido,edad,sexo
  end
  def saludar
    "Hola, soy #{@nombre} #{@apellido}."
  end
  def mi_edad
    "Tengo #{@edad} años."
  end
  def to_s
    saludar + ' ' + mi_edad
  end
end
