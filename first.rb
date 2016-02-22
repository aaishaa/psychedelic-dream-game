require 'gosu'
require 'pry'
require './lib/menu'
require './lib/player'
require './lib/star'
require './lib/zorder'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "sara's Sensual Psychadelic Game of Your Dreams"

    @background_image = Gosu::Image.new("media/swirl-bg.jpg", :tileable => true)

    @menu = Menu.new
    # binding.pry
    @player = Player.new
    @player.warp(320, 240)

    @star_anim = Gosu::Image::load_tiles("media/Hot_lips.png", 88, 60)
    @stars = Array.new
    @font = Gosu::Font.new(20)
    # @player_info = Gosu.
  end

  def update
    if @menu.displayed
      
      
    else
      if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft then
        @player.turn_left
      end
      if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight then
        @player.turn_right
      end
      if Gosu::button_down? Gosu::KbUp or Gosu::button_down? Gosu::GpButton0 then
        @player.accelerate
      end
      @player.move
      @player.collect_stars(@stars)

      if rand(100) <4 and @stars.size < 25 then
        @stars.push(Star.new(@star_anim))
      end
    end
  end

  def draw
    @menu.draw(self)
    @background_image.draw(0,0,ZOrder::Background)
    # @box = draw_rect(220, 240, 200, 30, 0xff_00ffff)
    @player.draw
    @stars.each { |star| star.draw }
    @font.draw("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
  end

  def draw_rect(x, y, width, height, color)
    draw_quad(x, y, color,
      x + width, y, color,
      x + width, y + height, color,
      x, y + height, color, 2)
  end

  def delete(element)
    element = nil
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    elsif id == Gosu::KbReturn
      if @menu.displayed
        @menu.displayed = false
      else
        @menu.displayed = true
      end
    end

  end
end

window = GameWindow.new
window.show