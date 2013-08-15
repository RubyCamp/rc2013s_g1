class Target < Product
    attr_writer :speed

    YOSHI = Sound.new("./sounds/yoshi.wav")
    AA = Sound.new("./sounds/aa.wav")

    def initialize(x, y, kind=rand(4))
        @@hp = 5
        super(x, y, kind)
    end

    def update
        self.y += @speed
    end

    def hit(bullet)
        # 倉橋さんの処理
        if self.kind == 4 or self.kind == 5
            @@hp -= 1
            YOSHI.play() and self.vanish and return if @@hp == 0
        else
            if self.kind == bullet.kind
                YOSHI.play() and self.vanish
            else
                AA.play() and return
            end
        end
    end
end