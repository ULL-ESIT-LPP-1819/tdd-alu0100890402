# Creando un struct de Nodos para la clase Lista
Node = Struct.new(:value,:next,:prev)

class List
  attr_reader :nodo
  def initialize(dato)
    @nodo = Node.new(dato, nil, nil)
  end
end
