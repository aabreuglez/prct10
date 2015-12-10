# encoding: UTF-8
require 'spec_helper'
require 'Bibliography'


describe Apa do
    before :each do
      @b1 = Libro.new(['Carlos Ruiz'],'La Sombra del Viento','','Planeta',9,'10 de Diciembre 2011',[9788408079545])
      @apa1 = Apa.new([@b1])
    end
    
    it "Existe una lista APA" do
        expect(@l1).to_not be nil
    end
    
    it "El nombre se invierte con el apellido" do
        expect(@apa1.pop_front.value.to_s).to eq("Ruiz Carlos")
    end
    it "El formato esperado es correcto para libros" do
        expect(@b1.to_s).to_eq 
    end
    
    it "El formato esperado es correcto para articulos" do
    end
    
    it "El formato es correcto apra articulos de periodicos" do
    end
    
    it "El formato es correcto para publicaciones electronicas" do
    end
end