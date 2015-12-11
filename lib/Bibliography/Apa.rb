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
    nodes=nodes.sort
    puts nodes[1]
    puts "=========="

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
      book = Proc.new{|elemento|
                        nombres=""
                        for i in elemento.autor do
                          
                          nombres+="#{i} & "
                        end
                        #puts nombres
                        nombres=nombres.chop.chop.chop
                        #Removemos el ultimo y espacio & 
                        #puts nombres
                        anio=elemento.fecha.split" "
                        anio=anio[-1]
                          
                        "#{nombres} (#{anio}). #{elemento.titulo} (#{elemento.edicion.to_s}) ().#{elemento.editorial}"
      }
      art = Proc.new{|elemento|
                        nombres=""
                        for i in elemento.autor do
                          nombres+="#{i} & "
                        end
                        #puts nombres
                        nombres=nombres.chop.chop.chop  
                        anio=elemento.fecha.split" "
                        anio=anio[-1]                        
                        "#{nombres} (#{anio}). #{elemento.titulo}, #{elemento.titrev} (#{elemento.paginas}) (#{elemento.volumen})"
      
      
                        ##expect(@apa4.to_s).to eq("Castagnino Juan (2007). 
                        #Técnicas, materiales y aplicaciones en nanotecnología, Acta Bioquímica Clínica Latinoamericana (41) (2)")
      }
      
      per = Proc.new{|elemento|
                        nombres=""
                        for i in elemento.autor do
                          
                          nombres+="#{i} & "
                        end
                        #puts nombres
                        nombres=nombres.chop.chop.chop         
                      "#{nombres} (#{elemento.fecha}). #{elemento.titulo}. #{elemento.diario},"
      }
      
      kindle = Proc.new{|elemento|
                        nombres=""
                        for i in elemento.autor do
                          
                          nombres+="#{i} & "
                        end
                        #puts nombres
                        nombres=nombres.chop.chop.chop         
                      "#{nombres} (#{elemento.fechaconsulta}). #{elemento.titulo}, [#{elemento.soporte}]. #{elemento.lugar}: .[#{elemento.fecha}]"      
      
              #"StoneCraft Wolf (5 mayor 1997) M. A vindication of the rights of women, [en línea]. New York: .[1996]")
      }
      devolver=""
      aux = @cola
      while aux != nil do
        puts "Estoy aqui por "
        if aux.value.instance_of? Libro
          devolver+=book.call(aux.value)
          devolver+='\n'
        elsif aux.value.instance_of? ArtRev
          devolver+=art.call(aux.value)
          devolver+='\n'
        elsif aux.value.instance_of? ArtPer
          devolver += per.call(aux.value)
          devolver+='\n'
        elsif aux.value.instance_of? Epub
          devolver += kindle.call(aux.value)
          devolver+='\n'
        end
        aux = aux.next
      
      end
      devolver
    end
end