require "dxruby"

class Textbox < Sprite
    attr_accessor :pushEnter, :str
    attr_reader :str_class

    CLASS = ["Array", "Numeric", "Hash"]

    def initialize(x1,y1,x2,y2)
        @str = ""
        @x = x1
        @y = y1
        @font = Font.new(30)
        @pushEnter = false
        @class_font = Font.new(30)
        @str_class = "#{CLASS[rand(CLASS.size)]}."
    end

    def input
        if Input.keyPush?(K_RETURN)
            @pushEnter = true
            return
        end
        @str += ";" if Input.keyPush?(K_SEMICOLON)
        @str += ":" if Input.keyPush?(K_COLON)
        @str += "-" if Input.keyPush?(K_MINUS)
        @str += "@" if Input.keyPush?(K_AT)
        @str += "_" if Input.keyPush?(K_BACKSLASH)
        @str += "," if Input.keyPush?(K_COMMA)
        @str += "." if Input.keyPush?(K_PERIOD)
        @str += "[" if Input.keyPush?(K_LBRACKET)
        @str += "]" if Input.keyPush?(K_RBRACKET)
        @str += "/" if Input.keyPush?(K_SLASH)
        @str += "\\" if Input.keyPush?(K_YEN)

        if Input.keyPush?(K_BACKSPACE)
            if @str.size == 1
                @str = ""
            elsif @str.size == 0
                # not working
            else
                @str = @str[0..@str.size-2]
            end
        end

        ("A".."Z").each do |char|
            if Input.keyPush?(eval("K_#{char}")) and (Input.keyDown?(K_LSHIFT) or Input.keyDown?(K_RSHIFT))
                @str << char
            elsif Input.keyPush?(eval("K_#{char}"))
                @str << char.downcase
            end
        end
    end

    def change_class
        @str_class = "#{CLASS[rand(CLASS.size)]}."
    end

    def update
        Window.drawFont(@x+110, @y, @str, @font)
        Window.drawFont(@x, @y, @str_class, @class_font)
    end
end