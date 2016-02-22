require 'gosu'
class Menu
  attr_reader :menu_action
  attr_accessor :displayed
  def initialize()
    # @box = draw_rect(220, 240, 200, 30, 0xff_00ffff)
    @pink = Gosu::Color.argb(0xff_ff00ff)
    @menu_text = Gosu::Font.new(20)
    @displayed = true
  end

  def update
    @name
    @menu_action
    @img.text_width(@menu_text, scale_x = 1)
  end

  def draw(window)
    if @displayed
    # adding menu window:
      @menu_text.draw("Control the lipstick with the arrows", 170, 205, 20, 1.0, 1.0, 0xff_000000)
      @menu_text.draw("on your keyboard. Hit the lips to", 170, 225, 20, 1.0, 1.0, 0xff_000000)
      @menu_text.draw("score more points!", 170, 245, 20, 1.0, 1.0, 0xff_000000)
      # pink = Gosu::Color.argb(0xff_ff00ff) 
      @pink = @menu_text.draw("Press ENTER to start!", 170, 265, 20, 1.0, 1.0, 0xff_ff00ff)
      @img = window.draw_rect(160, 200, 320, 90, 0xff_00ffff)
      # @select = window.draw_rect( 165, 252, 5, 5, 0xff_ffff00)
    end
  end
 
  def draw_rect(x, y, width, height, color)
    draw_quad(x, y, color,
      x + width, y, color,
      x + width, y + height, color,
      x, y + height, color, 2)
  end

end