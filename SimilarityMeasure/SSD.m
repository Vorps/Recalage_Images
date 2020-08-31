classdef SSD < Measure
   
    methods
        function [obj] = measure(obj, image1, image2)
            [m,n] = size(image1);
            obj.result = sqrt(sum(sum(((image1-image2).^2))/(m*n)));
        end
    end
end
