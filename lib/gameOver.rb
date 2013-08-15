require_relative './staff'

class Gameover
    def initialize(score)
        @@image = Image.load('./images/gameover.png')
        @@score = score
    end

    def input
        Director.change_scene(:title) if Input.keyPush?(K_SPACE)
        if Input.keyPush?(K_RETURN)
            require "Win32API"
            shellexecute = Win32API.new('shell32.dll', "ShellExecuteA", %w(p p p p p i),'i')
            shellexecute.call(0, 'open', "https://twitter.com/intent/tweet?text=puzz-ruby+%26+Matz+%E5%BE%97%E7%82%B9:+"+@@score.to_i.to_s+"%E7%82%B9", 0, 0, 1)
        end
    end

    def loop
        Window.draw(0, 0, @@image)
        Window.drawFont(Window.width/7*2, Window.height/7*3, "Score: #{@@score.to_i} \nEnter tweet.", Font.new(60))
    end

    def play
        loop()
        input()
    end
end