require './basedeco'

class CapitalizeDecorator < Decorate
  def correct_name
    @nameable.correct_name.capitalize
  end
end
