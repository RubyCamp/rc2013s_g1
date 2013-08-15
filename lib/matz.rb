#coding: utf-8

class Matz < Sprite
    IMG = Image.load("./images/matz_100.png")
    # IMG.setColorKey([0, 255, 0])
    X = Window.width/2 - IMG.width/2
    Y = Window.height/2 + IMG.height
    WINDOW_EDGE_L = 0
    WINDOW_EDGE_R = 800 - IMG.width
    SPEED = 10

    def initialize(x=X, y=Y, img=IMG)
        super
    end

    def update
        # Windowsの内側にいるとき
        if self.x > WINDOW_EDGE_L and self.x < WINDOW_EDGE_R
            # 画面外に出れなくする制御
            self.x += Input.x * SPEED
        # Window外に出ようとしたとき
        elsif self.x == WINDOW_EDGE_L
            unless Input.x < 0
                self.x += Input.x * SPEED
            end
        elsif self.x == WINDOW_EDGE_R
            unless Input.x > 0
                self.x += Input.x * SPEED
            end
        elsif self.x < WINDOW_EDGE_L
            self.x = WINDOW_EDGE_L
        elsif self.x > WINDOW_EDGE_R
            self.x = WINDOW_EDGE_R
        end
    end
end