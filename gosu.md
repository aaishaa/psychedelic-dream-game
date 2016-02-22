![id](/logo-large.png)


#What is Gosu?


Gosu is a 2D game development library that offers easy object oriented interfaces for Ruby and C++, available for Mac OS X, Windows and Linux. It's open source (MIT License), and the C++ version is also available for iPad, iPhone and iPod Touch. Gosu contains everything needed for basic building blocks of games letting the user forget about the low level code:


### A window with a main loop and callbacks
### 2D graphics and text, accelerated by 3D hardware
### Advanced color operations and mathematical functions
### Sound samples and music in various formats
### Keyboard, mouse, and gamepad input

##Let's get started

In Terminal...

Make a new directory: **mkdir gosu_app** and cd in

Touch a new ruby file: **touch file_name.rb**

Install some libraries:

**brew install sdl2**    

(Simple Directmedia Layer - offers sound/video/graphics integration)

**gem install gosu**

##Time to program

Open your text editor.

**We'll need to require gosu**

```
require 'Gosu'
```

**Next, make a Game Window. Gosu provides a Window class. Every Gosu App begins with this, your Ruby class will inherit from Gosu.  The 600, 480 parameters give the window a size (additionally fullscreen can be used by setting `fullscreen => true`) The window's title is added by setting the `self.caption` string.  Then the `update` and `draw` methods are used for the game, `update` handling the game logic (moves, etc.) and next `draw` is called to redraw the screen after `update` updates the moves:**



    class GameWindow < Gosu::Window
      def initialize
        super 600, 480
        self.caption = "Gosu Tutorial Game"
      end
      def update
      end
      def draw
      end
    end 
    window = GameWindow.new
    window.show


![id](/game_loop.png)
![id](/setup.png)

##Links:
  
[Getting Started/Gosu Docs](https://gosu-lang.github.io) |
[Good Beginner Tutorial](https://github.com/gosu/gosu/wiki/Ruby-Tutorial) |
[Beginner Tutorial](http://blog.flatironschool.com/look-ma-i-built-a-game/) |
[GitHub](https://github.com/gosu/gosu)|
[Flappy Bird Clone](https://github.com/yannvery/GosuFlappy)|
[Space Invaders Clone](https://github.com/DamirSvrtan/space-invaders.rb)|

