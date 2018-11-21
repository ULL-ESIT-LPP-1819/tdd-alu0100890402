class DatosAntrop
  attr_reader :peso, :talla, :edad, :sexo, :cintura, :cadera
  def initialize(peso, talla, edad, sexo, cintura, cadera)
    @peso, @talla, @edad, @sexo, @cintura, @cadera = peso, talla, edad, sexo, cintura.to_f, cadera.to_f
  end
  def to_s
    "IMC: #{imc}\ngrasa: #{grasa}%\nRCC: #{rcc}"
  end
  def imc_value
    (@peso / (@talla * @talla)).round(2)
  end
  def imc_descripcion
    case imc_value
    when (1)...(18.5)
      "Bajo peso"
    when (18.5)..(24.9)
      "Adecuado"
    when (25)..(29.9)
      "Sobrepeso"
    else
      "Obesidad"
    end
  end
  def imc
    "#{imc_value} (#{imc_descripcion})"
  end

  def grasa
    (1.2 * imc_value + 0.23 * edad - 10.8 * sexo - 5.4).round(2)
  end

  def rcc_value
    (@cintura/@cadera).round(3)
  end
  def rcc_riesgo
    if(@sexo == 1)
      case rcc_value
      when 0..(0.88)
        "Bajo"
      when (0.88)..(0.95)
        "Moderado"
      when (0.95)..(1.01)
        "Alto"
      else
        "Muy alto"
      end
    else
      case rcc_value
      when 0..(0.75)
        "Bajo"
      when (0.75)..(0.82)
        "Moderado"
      else
        "Alto"
      end
    end
  end

  def rcc
    "#{rcc_value} (riesgo #{rcc_riesgo})"
  end
end
