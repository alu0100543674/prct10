require "./lib/prct09/matriz.rb"

describe MatrizDensa do
	before :each do
		# Creamos una matriz llamada matrizSuper de tipo Matriz.
      matrizSuper = Matriz.new();
      
      # MATRICES ENTERAS
      # Densas
      @matriz1 = matrizSuper.tipo([[1, 2], [3, 4]])
      @matriz2 = matrizSuper.tipo([[2, 3], [4, 5]])
      @matrizComp = matrizSuper.tipo([[1, 2], [3, 4]])

     

      # Resultados
      @sumDensa = matrizSuper.tipo([[3, 5], [7, 9]])
      @mulDensa = matrizSuper.tipo([[10, 13], [22, 29]])
		@restDensa = matrizSuper.tipo([[1, 1], [1, 1]])
      
      
   end

   
	describe "# Filas y columnas de una matriz" do
	   it " Numero de filas " do
	      @matriz1.filas.should eq(2)
      end
      it " Numero de columnas " do
         @matriz1.columnas.should eq(2)
      end
	end

  
   describe "# Operaciones " do
		it " Suma " do
	 	   sum = @matriz1 + @matriz2
	      sum.should == @sumDensa
	   end

		it " Resta " do
			rest = @matriz2 - @matriz1
			rest.should == @restDensa
		end
	
	  	it "Maximo" do
   	   @matriz1.max.should eq(4)
      end

      it "Minimo" do
         @matriz1.min.should eq(1)
      end

   	it " Dos matrices densas " do
      	mult = @matriz1 * @matriz2
         mult.should == @mulDensa
      end

		it " Si son iguales " do
      	@matriz1.should == @matrizComp
      end
   end

   describe "# Densa: comparador " do
   	it " Menor, < " do
   	   (@matriz1 < @matriz2).should eq(true)
      end
      it " Mayor, > " do
         (@matriz1 > @matriz2).should eq(false)
      end
   end


end
