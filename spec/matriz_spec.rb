require "./lib/prct09/matriz.rb"

describe Matriz do
   before :each do
      # Creamos una matriz llamada matrizSuper de tipo Matriz.
      matrizSuper = Matriz.new();
      
      # Matrices enteras
      @matriz1 = matrizSuper.tipo([[1, 2], [3, 4]])
      @matriz2 = matrizSuper.tipo([[2, 3], [4, 5]])
      @matriz3 = matrizSuper.tipo([[1, 1], [1, 1]])
     
      
   end
end
