require_relative "./lib/director"
director = Director.new
Window.loop do
    break if Input.keyPush?(K_ESCAPE)
    director.play
end