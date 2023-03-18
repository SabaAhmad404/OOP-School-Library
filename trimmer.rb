require './basedeco'

class TrimmerDecorator < Decorate
  def correct_name
    output = @nameable.correct_name
    output.length > 10 ? output[0...10] : output
  end
end
