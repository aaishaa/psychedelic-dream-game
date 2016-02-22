require 'Gosu'


# class Welcome
# 	attr_accessor :x, :y, :w, :h

#   def initialize(window)
#   	# all setup is done in reset so it can be reused
#     reset(window)
#   end
	
# 	def reset(window)
# 		# create a new image using a random one from the candyList
#     @image = Gosu::Image.new(window, "welcome.png", false)
#  		@w = @image.width
# 		@h = @image.height
# 		# position it in the center of the window useing the window and image dimensions
# 		# place it half way across the screen and the pull it back half the width of the image
# 		@x = window.width / 2 - @image.width / 2
# 		@y = window.height / 2 - @image.height / 2
#   end

#   def draw
#     @image.draw(@x, @y, 1)
#   end

#  end


class Candy
	# accessors are here so we can figure out if items hit each other
  attr_accessor :x, :y, :w, :h


  # list of all sweet images
  def candyList
		['sweet1.png','sweet2.png','sweet3.png','sweet4.png','sweet5.png','sweet6.png','sweet7.png','sweet8.png']
	end	
  
  # automatically called when a new candy is made
  def initialize(window)
  	# all setup is done in reset so it can be reused
    reset(window)
  end

  # generic draw call. called each frame
  def draw
    @image.draw(@x, @y, 1)
  end

	# all the setup stuff
	def reset(window)
		# create a new image using a random one from the candyList
    @image = Gosu::Image.new(window, candyList.sample)
    # set w,h based on image size
    @w = @image.width
    @h = @image.height
    # a random Y value so it starts at a random place
	  @y = Random.rand(window.height - @h)
	  # velocity of Y is random from -5 to 5
	  # this changes the angle of the candy
	  @vy = rand(-5..5)
	  # x is set to the full width of the window so it starts on the right side
	  @x = window.width
	end

	# updates the candy's position
	def move
		# move 5px to the left
	  @x = @x - 5
	  # move up or down based on the Y velocity
	  @y = @y + @vy
	end
end

#### STAR ####
class Star
	# accessors are here so we can figure out if items hit each other
	attr_reader :x, :y, :w, :h

	def initialize(window)
		# velocitys of the star are always 5 or -5 : always 45 degree angles
		@vx = -5 # initially going left
		@vy = 5 # initially going down

		# create the gosu image
		@image = Gosu::Image.new(window,"star.png", false)
		# set the width and height based on the image
		@w = @image.width
		@h = @image.height
		# get a random x and y. 
		# ensure it will be on the screen by setting the limit to the screen width/height minus the stars width/height
		@x = Random.rand(window.width - @w)
		@y = Random.rand(window.height - @h)
	end 

	# updates the position of the star
	def move(window)
		# use the velocities to move the x and y
		@x = @x + @vx
		@y = @y + @vy
		# if the star hits the left edge change the vx to positive 5
		if @x < 0
			@vx = 5
		end
		# if the star hits the right side of the screen change the vx to negative 5
		if @x > window.width - @image.width
			@vx = -5
		end
		# if the star hits the top of the screen change the vy to positive 5
		if @y < 0
			@vy = 5
		end
		# if the star hits the bottom of the screen change the vy to negative 5 
		if @y > window.height - @image.height
			@vy = -5
		end
	end 

  # generic draw call. called each frame
	def draw
		@image.draw(@x, @y, 1)
	end

end


#### HORSE ####

class Horse
	attr_reader :x, :y, :w, :h

	def initialize(window)
		# create the gosu image
		@image = Gosu::Image.new(window, "horse.png", false)
		# set the width and heigh based on the image
		@w = @image.width
		@h = @image.height
		# position it in the center of the window useing the window and image dimensions
		# place it half way across the screen and the pull it back half the width of the image
		@x = window.width / 2 - @image.width / 2
		@y = window.height / 2 - @image.height / 2
	end

	# called when a star hits the horse
	def reset(window)
		# put the horse back in the center
		@x = window.width / 2 - @image.width / 2
		@y = window.height / 2 - @image.height / 2
	end

	# called when down arrow is pressed
	def move_down(window)
		# if the horse isn't yet at the bottom of the screen move it down 20
		if @y < window.height - @image.height
			@y = @y +20
		end
	end

	# called when up arrow is pressed
	def move_up
		# if the horse isn't yet at the top of the screen move it up 20
		if @y > 0
			@y = @y -20
		end
	end

	# called when left arrow is pressed
	def move_left
		# if the horse isn;t yet at the left of of the screne move it left 20
		if @x > 0
				@x = @x -20
		end
	end

	# caalled when right arrow is pressed
	def move_right(window)
		# if the horse isn't yet at the right edge move it right 20
		if @x < window.width - @image.width
			@x = @x +20
		end
	end 

  # generic draw call. called each frame
	def draw 
		@image.draw(@x, @y, 1)
	end
end


 

### GameWindow ###
# this is the main game class. there is only 1 per game.
# it loads all the other stuff and keeps track of timing
class GameWindow < Gosu::Window

	# called at start
	def initialize 
		# width and height of the screen
		# these are chosen based on the size of the horse and the move speed so the horse doesn't go off the edges
		# horse width + a value evenly divisble by 20 (move speed)
		super 710, 568, false # call the initialize method of your superclass of Gosu::Window 
		# text that appears at the top of the window
		self.caption = "get dat candy"
		# creates an array of stars and puts 1 star in it
		@stars = [Star.new(self)]
		# create the horse
		@horse = Horse.new(self)
		# create the candy
		@candy = Candy.new(self)
		# start the score at 0
  	@score = 0
  	# create a score text object
  	@score_text = Gosu::Font.new(self, 'Arial', 72)

  	# @welcome = Welcome.new(self)

  	# sets the background image
		@background_image = Gosu::Image.new("bg.png", :tileable => true)
	end

	def are_touching?(obj1, obj2) # to determine if star and bricks are touching - generic collision method for two rectangles
		obj1.x > obj2.x - obj1.w and obj1.x < obj2.x + obj2.w and obj1.y > obj2.y - obj1.h and obj1.y < obj2.y + obj2.h # able to write the .x and .y because of the attr_readers 
		# this was in the project i modified to make this but it seems that it checks each edge of the objects to see if they overlap
	end 

	# this is called every "frame"
	def update

		# sets up all the button controls
		if button_down?(Gosu::KbDown) # part of the Gosu gem 
			# the self is this window object 
			# this is needed for the position calculations
			@horse.move_down(self)
		end

		if button_down?(Gosu::KbUp) # part of the Gosu gem 
			@horse.move_up
		end

		if button_down?(Gosu::KbLeft) # part of the Gosu gem 
			@horse.move_left
		end
		
		if button_down?(Gosu::KbRight)
			@horse.move_right(self)
		end 
		
		# move all the stars
		@stars.each do |star|
			star.move(self)
			# check and see if any of them touch the horse
			if are_touching?(star, @horse)
				# if they touch the horse reset the game
				self.reset
			end
		end

		# move the candy
		@candy.move
		# if the candy gets passed the left edge of the screen reset it
		@candy.reset(self) if @candy.x < 0
		# see if the horse and candy touch
		if are_touching?(@candy, @horse)
			# increase the score every time the horse touches a candy
			@score = @score + 1
			# reset the candy when the horse touches it
			@candy.reset(self)
			# every time the score hits a multiple of 5
			if ( @score % 5 == 0 ) 
				# add another star
				@stars.push(Star.new(self))
			end
		end

	end

	# reset the game
	def reset 
		# rest horese
		@horse.reset(self)
		# clear stars to just 1
		@stars = [Star.new(self)]
		# reset score
		@score = 0
		# @welcome = Welcome.new(self)
	end

	# draw called every frame
	def draw
		# draws the background image
		# @welcome.draw
		@background_image.draw(0, 0, 0)
		# go through each star and draw them
		@stars.each do |star|
			star.draw
		end
		# draw the horse
		@horse.draw
		# draw the candy
		@candy.draw
		# draw the score
		@score_text.draw("#{@score}", 0, 0, 1)
	end 

end

# initialize the game
@window = GameWindow.new
# show the game
@window.show 
