# Extensions for Array class to help in Board#winner? and Board#draw? methods.
class Array
  # Checks if all elements in an Array is empty.
  def all_empty?
    self.all? { |e| e.to_s.empty? }
  end

  # Checks if all elements in an Array are same.
  def all_same?
    self.all? { |e| e == self[0] }
  end

  # Checks if any element in an Array is empty : "".
  def any_empty?
    self.any? { |e| e.to_s.empty? }
  end

  # Checks if no element in an Array is empty.
  def none_empty?
    !any_empty?
  end
end