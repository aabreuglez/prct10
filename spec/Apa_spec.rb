# encoding: UTF-8
require 'spec_helper'
require 'Bibliography'


describe Apa do
    before :each do
      @b1 = Libro.new(['Carlos Ruiz'],'La Sombra del Viento','','Planeta',9,'10 de Diciembre 2011',[9788408079545])
      @b2 = Libro.new(['Haruki Murakami'],'Tokio Blues','','Tusquets',8,'12 de Octubre de 2013',[4269218200010])
      @b3 = ArtPer.new()
      @b4 = Epub.new()
      @b5 = ArtRev.new()
      @apa1 = Apa.new([@b1,@b2])
      @apa2 = Apa.new([@b1])
    end
    
    it "Existe una lista APA" do
        expect(@l1).to_not be nil
    end
    
    it "El nombre se invierte con el apellido" do
        expect(@apa1.pop_front.autor).to eq(["Ruiz Carlos"])
    end
    it "El formato esperado es correcto para libros" do
        expect(@apa1.pop_front.to_s).to_eq 
    end
    
    it "El formato esperado es correcto para articulos" do
    end
    
    it "El formato es correcto apra articulos de periodicos" do
    end
    
    it "El formato es correcto para publicaciones electronicas" do
    end
end