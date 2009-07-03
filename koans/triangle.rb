# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  triangle = Triangle.new(a,b,c)
  triangle.type
end

class Triangle
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    raise TriangleError unless valid_triangle?
  end

  def type
    equilateral? || isosceles? || :scalene
  end

  private  
  def valid_triangle?
    return sides_are_positive? &&
      each_side_is_less_than_the_sum_of_the_other_two?
  end
  
  def sides_are_positive?
    [@a, @b, @c].min > 0
  end
  
  def each_side_is_less_than_the_sum_of_the_other_two?
    (@a < (@b + @c)) &&
    (@b < (@a + @c)) &&
    (@c < (@a + @b))
  end
  
  def equilateral?
    if (@a == @b && @a == @c)
      :equilateral
    end
  end
  
  def isosceles?
    if (@a == @b) || (@b == @c) || (@a == @c)
       :isosceles
     end
  end

end


# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
