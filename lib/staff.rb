class Staff
    STAFFROLL = Image.load("./images/staffroll.png")
    def initialize
        @@text = open("./staffroll.txt").read
        # FIXME: テキトー
        @@h = Window.height / 5 * 3
    end

    def self.sound
        Sound.new("./sounds/yoshi.wav").play()
    end

    def play
        # テキトーにちょーせーしました～～～～
        Director.change_scene(:title) and return if Input.keyPush?(K_SPACE) or @@h <= (-Window.height - 300)
        Window.draw(0, 0, STAFFROLL)
        self.print
    end

    def print
        @@h -= 3 #30 / 60.0
        Window.drawFont(Window.width/5*1, @@h, @@text, Font.new(70, "Impact"), color: [255, 255, 255])
    end
end

# 単体テスト
=begin
require "dxruby"
Staff.sound
staff = Staff.new
Window.loop do
    staff.print
end
=end