classdef Optimization < Measure & Show
    properties
        func;
        cout;
        value;
        realValue;
        complexity;
    end
    methods
        function obj = Optimization(func, realValue)
            obj.func = func;
            obj.realValue = realValue;
        end
    end
end