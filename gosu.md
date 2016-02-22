[id]: /logo-large.png


#What is Gosu?


Gosu is a 2D game development library for Ruby and C++, available for Mac OS X, Windows and Linux. It's open source (MIT License), and the C++ version is also available for iPad, iPhone and iPod Touch. Provides basic building blocks for games:


### A window with a main loop and callbacks
### 2D graphics and text, accelerated by 3D hardware
### Sound samples and music in various formats
### Keyboard, mouse, and gamepad input

##Let's get started

In Terminal...

Make a new directory: **mkdir gosu_app** and cd in

Touch a new ruby file: **touch file_name.rb**

Install some libraries:

**brew install sdl2**

**gem install gosu**

##Time to program

Open your text editor.

**We'll need to require gosu**

```
require 'Gosu'
```

**Next, make a Game Window. Gosu provides a Window class. Every Gosu App begins with this:**



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


[id]: /game_loop.png
[id]: /setup.png
