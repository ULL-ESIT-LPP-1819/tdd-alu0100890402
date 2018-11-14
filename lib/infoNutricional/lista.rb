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
    if empty
      @head, @tail = n, n
    else
      @head.prev = n
      @head = n
    end
  end
  def insertar_back(valor)
    n = Node.new(valor,nil,@tail)
    if empty
      @head, @tail = n, n
    else
      @tail.next = n
      @tail = n
    end
  end
  def pop_front
    res = @head
    @head = @head.next
    res.value
  end
  def pop_back
    res = @tail
    @tail = @tail.prev
    res.value
  end

  def to_s
    if empty
      return "H -> nil <- T"
    end
    cad = "H -> "
    current = @tail
    until current == nil
      cad = cad + current.value.to_s
      current = current.prev
      if (current != nil)
        cad = cad + " <-> "
      end
    end
    cad = cad + " <- T"
  end
end
