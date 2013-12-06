require './lib/prct09/fracciones.rb'

class Matriz
   include Enumerable
   include Comparable
        
   attr_reader :filas, :columnas, :matriz
   
   # Constructor
   def initialize()
   end

   # Convertir el array a matriz Densa o Dispersa.
   # Contamos el numero de ceros que tiene cada array, en el caso
   # de que sea menor de 60% la matriz será Densa, en caso contrario será
   # Dispersa.
   def tipo(m)
     @filas = m.length
     @columnas = m[0].length

     matrizRe = nil
     tamanio = @filas * @columnas

     ceros = 0
   
     for i in 0...@filas
       for j in 0...@columnas
          if (m[i][j] == 0)
             ceros += 1
          end
       end
     end
     
     #porcentaje = (ceros % tamanio)

     if (ceros % tamanio) < 0.6
        matrizRe = MatrizDensa.new(@filas, @columnas)
        matrizRe.copia(m)
     else
        matrizRe = MatrizDispersa.new(@filas, @columnas)
        matrizRe.copia(m)
     end

     matrizRe

  end


end

class MatrizDensa < Matriz
  def initialize(filas, columnas)
    @filas, @columnas = filas, columnas
    @matriz = Array.new{Array.new()}
    for i in 0...@filas
       @matriz[i] = Array.new()
    end
  end

  # Si el array pasado a la clase Matriz tiene un numero de ceros menor que
  # el porcentaje 60% es Densa por lo que entra en la clase MatrizDensa y 
  # se crea una matriz con copia(other).
  def copia(other)
    @filas = other.length
    @columnas = other[0].length
  
    for i in 0...other.length
      for j in 0...other[i].length
         @matriz[i][j] = other[i][j]
      end
    end
  end

  # Suma de matrices
  def +(other)
    suma = MatrizDensa.new(@filas, @columnas)
    for i in 0...@filas
       for j in 0...@columnas
          suma.matriz[i][j] = (@matriz[i][j] + other.matriz[i][j])
       end
     end
     suma
   end
  
   # Comparar dos matrices
   def ==(other)
     iguales = true
     for i in 0...@filas
       for j in 0...@columnas
         if (@matriz[i][j] != other.matriz[i][j])
            iguales = false
         end
       end
     end
     iguales
    end

   def *(other)
     multiplicacion = MatrizDensa.new(@filas, @columnas)
     for i in 0...@filas
       for j in 0...@columnas
          aux = 0
          for k in 0...other.filas
            aux += (@matriz[i][k] * other.matriz[k][j]) 
          end
          multiplicacion.matriz[i][j] = aux
       end
     end
     multiplicacion
   end

end

class MatrizDispersa < Matriz
  def initialize(filas, columnas)
    @filas, @columnas = filas, columnas
    @matriz = Hash.new()
  end

  # Si el array pasado a la clase Matriz tiene un numero de ceros mayor que
  # el porcentaje 60% es Dispersa por lo que entra en la clase 
  # MatrizDispersa y se crea un hash con copia(other), en el que solo se 
  # pondrán los valores distintos de cero.
  def copia(other)
    @filas = other.length
    @columnas = other[0].length
  
    for i in 0...other.length
      for j in 0...other[i].length
         if (other[i][j] != 0)
             @matriz["#{i},#{j}"] = other[i][j].to_i
         end
      end
    end
  end
end
