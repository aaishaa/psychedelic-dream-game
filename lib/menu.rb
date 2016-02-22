require 'gosu'
class Menu
  attr_reader :menu_action
  attr_accessor :displayed
  def initialize()
    # @box = draw_rect(220, 240, 200, 30, 0xff_00ffff)
    @menu_text = Gosu::Font.new(20)
    @displayed = true
  end

  def update
    @menu_action
  end

  def draw(window)
    if @displayed
    # adding menu window:
      @img = window.draw_rect(220, 240, 200, 30, 0xff_00ffff)
      @menu_text.draw("Move the arrows on your keyboard!", 220, 240, 10, 1.0, 1.0, 0xff_ffff00)
    end
  end
 
  def draw_rect(x, y, width, height, color)
    draw_quad(x, y, color,
      x + width, y, color,
      x + width, y + height, color,
      x, y + height, color, 2)
  end

  def delete
    @box = nil
    @menu_text = nil
  end

end