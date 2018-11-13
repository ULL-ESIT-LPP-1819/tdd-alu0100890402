# Creando un struct de Nodos para la clase Lista
Node = Struct.new(:value,:next,:prev)

class List
  attr_reader :head, :tail
  def initialize()
    @head, @tail = nil;
  end
  def empty
    @head === nil
  end
  def insertar_front(valor)
    n = Node.new(valor,@head,nil)
    @head = n
    if empty
      @tail = @head
    end
  end
  def insertar_back(valor)
    n = Node.new(valor,nil,@tail)
    @tail = n
    if empty
      @head = @tail
    end
  end
  def eliminar_front
  end
end
