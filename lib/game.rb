require "dxruby"
require_relative "./matz"
require_relative "./bullet"
require_relative "./productController"
require_relative "./textbox"
require_relative "./judge"

Window.width = 800
Window.height = 600

class Game
    attr_reader :score

    AA = Sound.new("./sounds/aa.wav")

    def initialize
        @score = 0

        @judge = Judge.new

        @targets = ProductController.new

        @textbox = Textbox.new(70, 500, 800, 600)

        @@font = Font.new(30)

        @@image = Image.load('./images/game.png')
    end

    def input
        if @textbox.pushEnter
            @judge.class_name = @textbox.str_class
            if @judge.success?(@textbox.str)
                @targets.input
            else
                AA.play()
            end
            @textbox.pushEnter = false
            @textbox.str = ""
            @textbox.change_class
        end
        @textbox.input()
    end

    def loop
        Window.draw(0, 0, @@image)
        @score += 1 / 60.0
        Window.drawFont(Window.width/5*4, Window.height/10*9, "Score: #{@score.to_i}", @@font)

        @targets.draw()
        @targets.check()
        @targets.clean()

        if @targets.update() == "collision!"
            Director.change_scene(:gameover, @score)
        end

        @textbox.update()
    end

    def play
        loop()
        input()
    end
end