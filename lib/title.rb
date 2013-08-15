class Title
    def initialize
        @@image = Image.load('images/title.png')
    end

    def input
        Director.change_scene(:game) if Input.keyPush?(K_RETURN)
        Director.change_scene(:staff) if Input.keyPush?(K_SPACE)
    end

    def loop
        Window.draw(0, 0, @@image)
    end

    def play
        loop()
        input()
    end
end