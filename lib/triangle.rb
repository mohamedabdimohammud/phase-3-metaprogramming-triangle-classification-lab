class Triangle
    class TriangleError < StandardError
    end
  
    def initialize(side1, side2, side3)
      @side1 = side1
      @side2 = side2
      @side3 = side3
      validate_triangle
    end
  
    def kind
      if @side1 == @side2 && @side2 == @side3
        :equilateral
      elsif @side1 == @side2 || @side1 == @side3 || @side2 == @side3
        :isosceles
      else
        :scalene
      end
    end
  
    private
  
    def validate_triangle
      if @side1 <= 0 || @side2 <= 0 || @side3 <= 0
        raise TriangleError, "Triangle sides must be greater than zero."
      elsif @side1 + @side2 <= @side3 || @side1 + @side3 <= @side2 || @side2 + @side3 <= @side1
        raise TriangleError, "Triangle inequality violation."
      end
    end
  end  
end
