# encoding: utf-8

require_relative "./target"

IMG_WIDTH = 60
IMG_HEIGHT = 55

class ProductController
    #特産品がセットされる範囲
    SPOT_Y = 200
    SPOT_X = 800

    #特産品を生成する
    def initialize
        @count_update = 0
        @targets = []
        @products_h = 11 #画面上の特産品の横の数
        @products_v = 4 #画面に表示される特産物の縦の数
        @bullets = []
        @kind = rand(4)
        @next_bullet = Bullet.new(20, 500, @kind)
        @matz = Matz.new()#Window.width/2, Window.height/2)
        @@hidden_bar = Sprite.new(0, Window.height/3*1.75, Image.new(800, 10, color=[0,0,0,0]))
        # 経過時間
        @@time = 0
        # 特産物の落下スピード
        @@fall_speed = 0.02

        @products_v.times do |j|
            @products_h.times do |i|
                target = Target.new(80+IMG_WIDTH*i, IMG_HEIGHT*(@products_v-1)-IMG_HEIGHT*j)
                target.speed = @@fall_speed
                @targets << target
            end
        end
    end

    def update
        @@time += 1
        @targets.each do |target|
            target.update
            # 衝突した場合
            if target === @@hidden_bar
                # 当たった事を判定する
                return "collision!"
            end
        end

        # 上からでる特産物の生成
        # ???:
        if (@count_update*@@fall_speed) % IMG_HEIGHT == 0
            @products_h.times do |i|
                if @@time >= 5
                    #target = Target.new(80+IMG_WIDTH*i, -1 * IMG_HEIGHT, rand(8)%6)
                    target = Target.new(80+IMG_WIDTH*i, -1 * IMG_HEIGHT, rand(6))
                    target.speed = @@fall_speed
                    @targets << target
                else
                    target = Target.new(80+IMG_WIDTH*i, -1 * IMG_HEIGHT)
                    target.speed = @@fall_speed
                    @targets << target
                end
            end
        end

        @count_update += 1
    end

    def input
        @bullets << Bullet.new(@matz.x+Matz::IMG.width/2-15, @matz.y, @kind)
        @kind = rand(4)
        @next_bullet = Bullet.new(20, 500, @kind)
    end

    def draw
        @@hidden_bar.draw()

        @matz.draw()
        @matz.update()

        @next_bullet.draw()
        @bullets.each do |bullet|
            bullet.update()
            bullet.draw()
        end

        Sprite.draw(@targets)
    end

    def check
        Sprite.check(@bullets, @targets)
    end

    def clean
        Sprite.clean(@targets)
        Sprite.clean(@bullets)
    end
end