classdef DiffImages < Measure
    methods
        function obj = measure(obj, image1, image2)
            obj.result = sum(sum(image1 ~= image2));
        end
    end
end
