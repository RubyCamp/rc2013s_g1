class Judge
    attr_writer :class_name
    CLASS = ["Object"]

    def initialize
        @class_name = CLASS[rand(CLASS.size-1)]
    end

    def success?(input_str)
        input_str.chomp!
        class_name = @class_name.chop
        methods = eval("#{class_name}.methods")
        return methods.include?(input_str.to_sym)
    end
end