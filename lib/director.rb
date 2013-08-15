require_relative "title"
require_relative "game"
require_relative "gameOver"
require_relative "staff"

class Director
    def initialize
        @@scene = Title.new
    end

    def play
        @@scene.play
    end

    # TODO: コードがキモい
    def self.change_scene(scene, arg="")
        class_name = scene.to_s[0].upcase + scene.to_s[1..scene.size]
        unless class_name == "Gameover"
            @@scene = eval("#{class_name}.new")
        else
            @@scene = eval("#{class_name}.new(#{arg})")
        end
    end
end