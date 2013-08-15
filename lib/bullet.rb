#coding: utf-8

require_relative 'product'
class Bullet < Product
    # 倉橋さんを含むイメージ要素が5であり、
    # それを取り除くため
    def initialize(x, y, kind=rand(4))
        super(x, y, kind)
    end

    def update
        @speed = -10
        self.y += @speed
    end

    def shot(target)
        self.vanish
    end
end