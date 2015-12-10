class Apa < Lista
  def initialize(nodes)
    for i in 0..nodes.length-1 do
      raise 'APA uses bibliography types' unless nodes[i].kind_of? Bibliography
    end
    for i in 0..nodes.length-1 do
      nuevoautor=[]
      for j in nodes[i].autor do
        a=j.split
        j=a.insert(0,a.delete_at(1))
        j=j.join(" ")
        nuevoautor.push(j)
      end
      nodes[i].autor=nuevoautor
    end
    for i in 0..nodes.length-1 do
      nodes[i]=Node.new(nodes[i],nil,nil)
    end
    
    j = nodes.length
    j -= 1
    @cola = nodes[0]
    @cabeza = nodes[j]
    if j > 1
      @cola.next = nodes[1]
      for i in 1..j-1 do
        nodes[i].next = nodes[i+1]
        nodes[i].prev = nodes[i-1]
      end
      @cabeza.prev = nodes[j-1]
    else 
      if j == 1
        @cabeza.prev = @cola
        @cola.next = @cabeza
      else
        @cabeza = @cola
      end
    end
   
  end    
    
    def sort
    end
    
    def to_s
    end
end