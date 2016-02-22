require 'rubygems'
require 'gosu'

class DemoWindow < Gosu::Window
 def initialize
    super(640, 400, false)
    self.caption = "Nice Lines"
    draw_quad = false

 end

 def update
 end

 def draw
   x = 300
   y = 200
   z = 150
   size = 100
   squ = 125
   line = 150
   draw_quad(x-squ, y-squ, 0xffff00ff, x+squ, y-squ, 0xffff00ff, x-squ, y+squ, 0xffff00ff, x+squ, y+squ, 0xffff00ff, 0)
   draw_triangle(x-size, y-size, 0xff00ff00, x+size, y-size, 0xff00ff00, x-size, y+size, 0xff00ff00)
   draw_line(x-line, y-line, 0xff00ffff, x+line, y+line, 0xff00ffff)
 end
end

DemoWindow.new.show