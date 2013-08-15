# encoding: utf-8

#coding: utf-8

class Product < Sprite
    SIZIMI = Image.load("./images/sizimi_50.png")
    RUBY = Image.load("./images/ruby_50.png")
    ICHIZIKU = Image.load("./images/ichijiku_50.png")
    BUDOU = Image.load("./images/budo_50.png")
    KURAHASHI = Image.load("./images/kurahashi_dake.png")
    NOZAKA = Image.load("./images/nozaka_dake.png")
    @@images = [SIZIMI, RUBY, ICHIZIKU, BUDOU, KURAHASHI, NOZAKA]

    #特産品をランダムに1つ生成する
    def initialize(x, y, kind = rand(@@images.size))
        @speed = 4 #とりあえず4にしています
        @kind = kind
        super(x, y, @@images[@kind])
    end

    def kind
        @kind
    end
end